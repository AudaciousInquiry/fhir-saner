package com.ainq.fhir.saner.tools.testcase;

import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import org.apache.commons.lang3.StringUtils;
import org.hl7.fhir.r4.model.Base;
import org.hl7.fhir.r4.model.Bundle;
import org.hl7.fhir.r4.model.Property;
import org.hl7.fhir.r4.model.Reference;
import org.hl7.fhir.r4.model.Resource;
import org.hl7.fhir.r4.model.StringType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ainq.fhir.saner.tools.FhirToGson;
import com.ainq.fhir.saner.tools.testcase.parser.Cases;
import com.ainq.fhir.saner.tools.testcase.parser.Constraint;
import com.ainq.fhir.saner.tools.testcase.parser.Constraint.Context;
import com.ainq.fhir.saner.tools.testcase.parser.Datum;
import com.ainq.fhir.saner.tools.testcase.parser.Datum.Expansion;
import com.ainq.fhir.saner.tools.testcase.parser.Datum.Instructions;
import com.ainq.fhir.saner.tools.testcase.parser.Parser;
import com.ainq.fhir.saner.tools.testcase.parser.TestCase;
import com.ainq.fhir.saner.tools.testcase.parser.Variation;

public class Generator {
    private static final Logger LOGGER = LoggerFactory.getLogger(Generator.class);
    Cases model;

    public static void main(String args[]) {
        for (String arg : args) {
            Parser p;
            try {
                if ("-e".equals(arg)) {
                    break;
                }
                System.out.printf("Reading %s%n", arg);
                p = new Parser(new FileReader(arg, StandardCharsets.UTF_8));
                Cases l = p.parse();
                l.setSource(arg);
//                System.out.printf("%s%n", gsonIt(l));
                Generator g = new Generator(l);
                g.generate();
            } catch (ParseException ex) {
                int line = ex.getErrorOffset();
                System.err.printf("Exception: %s at (%s:%d)\n", ex.getMessage(), arg, line);
                ex.printStackTrace();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    /**
     * Create a generator for a test case model.
     *
     * @param model The model to generate test cases for.
     */
    public Generator(Cases model) {
        this.model = model;
    }

    /**
     * Generate test cases from the model.
     *
     * A Test Case describes a bundle of data to generate. There may be variations
     * created based on the test case model, so each test case generates a list of
     * bundles.
     *
     * A model can have multiple test cases.
     *
     * @return List of list of bundles where each inner list contains the bundles
     *         supporting an individual test case, and the outer list contains an
     *         inner list for each test case.
     *
     * @throws IOException
     */
    public List<List<Bundle>> generate() throws IOException {
        // For each test case
        // Generate the list of bundles for the case
        // End For

        List<List<Bundle>> caseList = new ArrayList<>();
        for (TestCase c : model.getTestCases()) {
            List<Bundle> b = generate(c);
            caseList.add(b);
        }
        return caseList;
    }

    /**
     * Given a test case, generate the bundles that describe the variations.
     *
     * @param c The test case to generate
     * @return The list of bundles providing test examples for each variant being
     *         tested in the test case.
     *
     * @throws IOException
     */
    private List<Bundle> generate(TestCase c) throws IOException {
        // for each resource that is a datum for the test case
        // generate all variations on the resource
        // If field in a resource references a datum elsewhere
        // generate all the necessary variations for that datum
        // apply the variations to the resource
        // end if
        // end for

        for (Datum d : c.getDataset()) {
            generateDataElementVariations(c, d);
        }

        /*
         * GsonBuilder builder = new GsonBuilder();
         * builder.registerTypeHierarchyAdapter(Base.class, new GsonBaseAdapter()); Gson
         * gson = builder.setPrettyPrinting().create();
         * System.out.printf("Variants: %s%n", gson.toJson(variants));
         * System.out.printf("Result: %s%n", gson.toJson(result));
         */
        List<Bundle> bundles = makeBundles(c);
        for (Bundle bundle : bundles) {
            for (Bundle.BundleEntryComponent entry: bundle.getEntry()) {
                // Sushifier.sushify(m, (Resource) d.getPrototype(), d.getName(), d.getType(),
                // index, new PrintWriter(System.out));
            }

        }

        return bundles;
    }

    /**
     * Given a test case, and a datum to be produced for it, generate the essential
     * variations in the datum.
     *
     * @param c Test case for which this datum is being generated.
     * @param d The datum being represented.
     *
     * @throws IOException
     */
    private void generateDataElementVariations(TestCase c, Datum d) throws IOException {
        // For each variation of the resource that can be made

        int qty = Math.max(1, d.getNumber());
        qty = 1;

        for (int i = 1; i <= qty; i++) {
            Map<String, List<Base>> variants = new TreeMap<>();
            c.getContext().clear();
            for (Variation var : d.getVariations()) {
                vary(variants, var, c.getContext());
            }
            // From here, compute the variations induced by variants include a
            // List<Map<String, Base>>
            Expansion expansion = expand(c.getContext(), d.getName(),
                d.getPrototype() instanceof Resource ? d.getType() : null, variants);
            d.setExpansion(expansion);
        }
    }

    /**
     * Apply field constraints from a variation, producing a list of instructions on
     * how to create the element in changes.
     *
     * After running this for eeach variant, changes will contain the set of
     * instructions to produce the needed instances
     *
     * @param changes The changes to apply.
     * @param var     The varations to address for the field.
     *
     * @param var
     */
    private void vary(Map<String, List<Base>> changes, Variation var, Context context) {
        for (Constraint constraint : var.getConstraint()) {
            Map.Entry<String, List<Base>> change = constraint.getChange(context);

            List<Base> variations = changes.get(change.getKey());

            if (variations == null) {
                changes.put(change.getKey(), variations = new ArrayList<Base>());
            }

            List<? extends Base> value = change.getValue();

            if (value != null) {
                variations.addAll(value);
            }
        }
    }

    /**
     * Given a Map of the list of instructions fields values that need to change in
     * variation ways, produce a list of maps that enumerate the instructions.
     * appropriately segmented into resources.
     *
     * @param name     The name of the artifact to product
     * @param variants The instructions on how to produce it for each variant.
     *
     * @return The instructions for producing the data.
     */
    private Expansion expand(Context context, String name, String type, Map<String, List<Base>> variants) {
        Expansion result = new Expansion();
        result.add(new Instructions());

        for (Map.Entry<String, List<Base>> entry : variants.entrySet()) {
            List<Base> list = entry.getValue();
            String key = entry.getKey();
            if (list.size() == 0) {
                // Do nothing if there is nothing to do
                continue;
            }

            // If there's only one output
            if (list.size() == 1) {
                // Append the element to each map in result
                for (Map<String, Base> m : result) {
                    // Append new data to the list
                    m.put(key, list.get(0));
                }
            }

            // copy output map
            result = new Expansion(duplicateResults(result, list, key), null);
        }
        int counter = 0;
        for (Map<String, Base> m : result) {
            StringBuilder b = new StringBuilder();
            if (type != null) {
                b.append(type).append("/");
            }
            // ensure index is distinguishable from identifier by trailing -
            // as identifiers may end in a number
            b.append(name).append("-").append(++counter);
            m.put("id", new StringType(b.toString()));
        }
        return fixUp(name, result);
    }

    /**
     * Given a set of results, and a new list of variations to apply to it, produce
     * the cartesian product of result * list.
     *
     * @param result The original result set.
     * @param list   The variations to create on it.
     * @param key    The identifier of the variant applied
     * @return The duplicated data in an array.
     */
    private Instructions[] duplicateResults(Expansion result, List<Base> list, String key) {
        // list.size >> 1: We need to grow the map
        Instructions maps[] = (Instructions[]) new Instructions[list.size() * result.size()];

        // For each element in the list
        for (int j = 0; j < list.size(); j++) {
            // duplicate the existing output list.size times for every existing
            for (int i = 0; i < result.size(); i++) {
                Instructions existingResult = result.get(i);
                maps[i * list.size() + j] = new Instructions(existingResult);
                // Append new data to list
                maps[i * list.size() + j].put(key, list.get(j));
            }
        }
        return maps;
    }

    /**
     * Instructions may not yet be accurate, b/c it will have placeholders for datum
     * that are referenced multiple times:
     *
     * e.g.: When aDate is a date that can have two values, and the expansion
     * references aDate, the first such instruction will vary, but the second and
     * remaining will not (b/c they don't actually introduce variation). The first
     * such instruction in the expansion would reference aDate-1, or aDate-2 but
     * second and subsequent will incorrectly reference aDate-1.
     *
     * @param maps
     * @return
     */
    private Expansion fixUp(String name, Expansion result) {

        // System.out.printf("Before %s: %s%n", name, gsonIt((Object)result)[0]);
        if (result.size() < 2) {
            return result;
        }

        for (Instructions m : result) {
            if (m.size() < 2) {
                continue;
            }
            TreeMap<String, Base> origins = new TreeMap<>();
            List<Map.Entry<String, Base>> fixups = new ArrayList<>();
            for (Map.Entry<String, Base> e : m.entrySet()) {
                @SuppressWarnings("unused")
                String key = e.getKey();
                Instructions i = (Instructions) e.getValue().getUserData("rules");
                if (i == null) {
                    continue;
                }
                Base idValue = i.get("id");
                if (idValue == null) {
                    continue;
                }
                String keyValue = idValue.primitiveValue();
                if ("1".equals(StringUtils.substringAfterLast(keyValue, "-"))) {
                    // This instruction may need to be fixed.
                    fixups.add(e);
                } else {
                    // This may be the correct value for some instruction
                    origins.put(StringUtils.substringBeforeLast(keyValue, "-"), e.getValue());
                }
            }
            if (origins.isEmpty()) {
                // No meaningful variation to fix up
                continue;
            }
            // For each instruction to be fixed up
            for (Map.Entry<String, Base> e : fixups) {
                Instructions i = (Instructions) e.getValue().getUserData("rules");
                String ruleKey = StringUtils.substringBeforeLast(i.get("id").primitiveValue(), "-");
                Base b = origins.get(ruleKey);
                if (b != null) {
                    // System.out.printf("%s(%s) %s%n",
                    // e.getKey(), ruleKey, Arrays.asList(gsonIt(e.getValue(), " to ", b)));
                    e.setValue(b);
                }
            }
        }
        // System.out.printf("After %s: %s%n", name, gsonIt((Object)result)[0]);
        return result;
    }

    /**
     * Make the bundles essential for the specified test case.
     * @param c The test case to make a bundle for.
     * @return  A list of bundles.
     */
    private List<Bundle> makeBundles(TestCase c) {
        Map<String, Integer> indexer = new TreeMap<>();
        List<String> map = new ArrayList<>();
        createIndexes(c, indexer, map);

        int graph[][] = new int[indexer.size()][indexer.size()];

        initializeGraph(c, indexer, graph);

        closure(graph);

        List<Set<String>> reachable = computeMutuallyReachableSets(map, graph);
        reachable = regroupData(reachable, c);

        List<Bundle> list = new ArrayList<>();
        Map<String, List<Resource>> availableChoices = getAvailableResources(c);

        String variation = "a";
        // For each bundle grouping in the list
        for (Set<String> bundle: reachable) {
            Bundle b = new Bundle();
            list.add(b);
            for (String resourceRef : bundle) {
                Resource res = getNextResource(availableChoices, resourceRef, c);
                b.addEntry().setResource(res);
            }
            // Adjust references so that patient-1 becomes patient-1a for this bundle
            adjustReferences(b, variation);
            variation = nextVariationId(variation);
        }
        // reachable now contains the set of bundles to create.
        return list;
    }

    private void adjustReferences(Bundle b, String variation) {
        // For each resource in the bundle, append variation to the resource identifier.
        //  For each reference in the resource (or children), append variation to the reference.
        for (Bundle.BundleEntryComponent e: b.getEntry()) {
            Resource r = e.getResource();
            r.setId(r.getId() + variation);
            adjustReferences(r, variation);
        }
    }

    private void adjustReferences(Base r, String variation) {
        List<Property> props = r.children();
        for (Property p: props) {
            if (p.getTypeCode().contains("Reference")) {
                List<Base> refs = p.getValues();
                for (Base b: refs) {
                    Reference ref = (Reference) b;
                    if (ref != null) {
                        String v = ref.getReference();
                        ref.setReference(v + variation);
                    }
                }
            } else {
                // Traverse children
                p.getValues().forEach(v -> adjustReferences(v, variation));;
            }
        }
    }

    private String nextVariationId(String variation) {
        char c = variation.charAt(variation.length()-1);
        if (c < 'z') {
            c++;
            return variation.substring(0, variation.length() - 1) + c;
        }
        if (variation.length() == 1) {
            return "aa";
        }
        c = variation.charAt(variation.length() - 2);
        if (c < 'z') {
            c++;
            return variation.substring(0, variation.length() - 2) + c + 'a';
        }
        if (variation.length() == 2) {
            return "aaa";
        }
        c = variation.charAt(variation.length() - 3);
        if (c < 'z') {
            c++;
            return variation.substring(0, variation.length() - 3) + c + "aa";
        }

        throw new RuntimeException("To many variations " + variation);
    }

    private Resource getNextResource(Map<String, List<Resource>> availableChoices, String resourceRef, TestCase c) {
        List<Resource> l = availableChoices.get(resourceRef);
        if (l == null) {
            throw new RuntimeException("Cannot find a candidate for " + resourceRef);
        }

        if (!l.isEmpty()) {
            // Return the requested resource.
            Resource r = l.remove(0);
            if (l.isEmpty()) {
                // Refill L with new values.
                String key = referenceToName(resourceRef);
                Datum d = c.getDatumByName(key);
                List<Base> values = d.getAllValues(c.getContext());
                for (Base b: values) {
                    if (b instanceof Resource) {
                        l = availableChoices.get(b.getIdBase());
                        l.add((Resource) b);
                    }
                }
            }
            return r;
        }

        return null;
    }

    private Map<String, List<Resource>> getAvailableResources(TestCase c) {

        return null;
    }

    private List<Set<String>> regroupData(List<Set<String>> reachable, TestCase c) {
        /*
         * For each pair of sets a, b in reachable: If all Resourcees in a are either
         * the same variations in b, or a separate from resources in b then these two
         * might be merged.
         */
        List<Set<String>> newReachable = new ArrayList<>();


        LOGGER.trace("Before: \n{}", FhirToGson.fhirToGsonProducer(reachable));

        // Remove any set that is a strict subset of another, it will be covered.
        removeProperSubsets(reachable);
        int size = reachable.size();
        LOGGER.trace("Cleaned: \n{}", FhirToGson.fhirToGsonProducer(reachable));

        for (int i = 0; i < size - 1; i++) {
            boolean mergedAtLeastOnce = false;
            for (int j = i + 1; j < size; j++) {
                Set<String> leftDep = getAllDependencies(c, reachable.get(i));
                Set<String> rightDep = getAllDependencies(c, reachable.get(j));
                // Mark the sets as merge candidates
                if (isCompatible(leftDep, rightDep)) {
                    LOGGER.trace("{}:{} compatible with {}:{}", i, leftDep, j, rightDep);
                    Set<String> newSet = new TreeSet<>(reachable.get(i));
                    newSet.addAll(reachable.get(j));
                    newReachable.add(newSet);
                    mergedAtLeastOnce = true;
                } else {
                    LOGGER.trace("{}:{} INCOMPATIBLE with {}:{}", i, leftDep, j, rightDep);
                }
            }
            if (!mergedAtLeastOnce) {
                // The set at i was never merged, therefore it should be added.
                newReachable.add(reachable.get(i));
                if (i == size - 2) {
                    newReachable.add(reachable.get(i + 1));
                }
            }
        }
        removeProperSubsets(newReachable);
        LOGGER.trace("Result: \n{}", FhirToGson.fhirToGsonProducer(newReachable));

        return newReachable;
    }

    private int removeProperSubsets(List<Set<String>> reachable) {
        int size = reachable.size();
        for (int i = 0; i < size; i++) {
            for (int j = i + 1; j < size; j++) {
                if (reachable.get(i).containsAll(reachable.get(j))) {
                    reachable.remove(j--);
                    size--;
                } else if (reachable.get(j).containsAll(reachable.get(i))) {
                    reachable.set(i, reachable.get(j));
                    reachable.remove(j--);
                    size--;
                }
            }
        }
        return size;
    }

    private Set<String> getAllDependencies(TestCase c, Set<String> set) {
        Set<String> m = new TreeSet<>();
        for (String ref : set) {
            Datum d = c.getDatumByName(referenceToName(ref));
            int index = Integer.parseInt(StringUtils.substringAfterLast(ref, "-")) - 1;
            m.addAll(d.getDependencies(index));
        }
        return m;
    }

    public static String referenceToName(String ref) {
        return StringUtils.substringBeforeLast(StringUtils.substringAfter(ref, "/"), "-");
    }

    private boolean isCompatible(Set<String> leftDep, Set<String> rightDep) {
        // returns true if all dependencies are mutual and non-interfering
        // e.g., the dependencies from group A does not conflict with the dependencies
        // from group B
        // then these two groups should be merged.
        Set<String> compatibleSet = new TreeSet<>();
        for (String s : leftDep) {
            // Create Resource/resource from Resource/resource-1 string
            String k = StringUtils.substringBeforeLast(s, "-");
            // Add Resource/resource to compatibleSet.
            compatibleSet.add(k);
        }
        for (String s : rightDep) {
            String k = StringUtils.substringBeforeLast(s, "-");
            // See if k is present
            if (compatibleSet.contains(k)) {
                // and if it is not compatible, then return false.
                if (!leftDep.contains(s)) {
                    return false;
                }
            }
        }
        return true;
    }

    private void initializeGraph(TestCase c, Map<String, Integer> indexer, int[][] graph) {
        List<Resource> list = new ArrayList<>();
        for (Datum d : c.getDataset()) {
            if (d.getPrototype() instanceof Resource) {
                Expansion m = d.getExpansion();
                processResource(indexer, graph, m);
                list.add((Resource) d.getPrototype());
            }
        }

        for (int i = 0; i < list.size(); i++) {
            for (int j = i + 1; j < list.size(); j++) {
                Resource a = list.get(i), b = list.get(j);
                /*
                 * For any pair of resources a and b, If there is not dependency between a and b
                 * in the graph then see if these two resources have a mutual dependency in the
                 * graph, e.g. both depend on the same instance of startTime
                 */
                Set<String> db = Datum.computeDependencies(b);
                if (Datum.computeDependencies(a).stream().anyMatch(da -> db.contains(da))) {
                    System.out.printf("%s shares dependencies with %s%n", a.getId(), b.getId());
                }
            }
        }
    }

    private void processResource(Map<String, Integer> indexer, int[][] graph, Expansion m) {
        for (Map<String, Base> s : m) {
            String id = s.get("id").primitiveValue();
            int source = indexer.get(id);
            // Source reaches itself
            graph[source][source] = 1;
            for (Map.Entry<String, Base> e : s.entrySet()) {
                if (e.getValue() instanceof Resource) {
                    Resource res = (Resource) e.getValue();
                    String targetId = res.getId();
                    Integer target = indexer.get(targetId);
                    if (target != null) {
                        // source reaches target
                        graph[source][target] = 1;

                        // source can be reached from elsewhere
                        graph[target][source] = -1;
                    }
                }
            }
        }
    }

    private void createIndexes(TestCase c, Map<String, Integer> indexer, List<String> map) {
        for (Datum d : c.getDataset()) {
            if (d.getPrototype() instanceof Resource) {
                Expansion e = d.getExpansion();
                for (Map<String, Base> s : e) {
                    String id = s.get("id").primitiveValue();
                    map.add(id);
                    indexer.put(id, indexer.size());
                }
            }
        }
    }

    /**
     * Compute a reflexive closure on graph where graph is an array of integers with
     * a value of 1 for each element reachable from another element.
     *
     * @param graph The graph to compute the closure on in place.
     */
    private void closure(int[][] graph) {
        // Compute the closure of reachable things
        for (int i = 0; i < graph.length; i++) {
            for (int j = i + 1; j < graph.length; j++) {
                // If i can reach j
                if (graph[i][j] == 1) {
                    // For each k from j
                    for (int k = 0; k < graph.length; k++) {
                        // If j can reach k
                        if (graph[j][k] == 1) {
                            // Then i can reach k
                            graph[i][k] = 1;
                            if (graph[k][i] != 1) {
                                graph[k][i] = -1;
                            }
                        }
                    }
                }
            }
        }
    }

    /**
     * Compute the mutually reachable sets
     *
     * @param map
     * @param graph
     * @param reachable
     */
    private List<Set<String>> computeMutuallyReachableSets(List<String> map, int[][] graph) {
        List<Set<String>> reachable = new ArrayList<>();

        for (int i = 0; i < map.size(); i++) {
            String id = map.get(i);
            if (id == null) {
                continue;
            }
            Set<String> s = new TreeSet<>();
            for (int j = 0; j <= i; j++) {
                if (graph[i][j] == 1) {
                    String targetId = map.get(j);
                    if (targetId == null) {
                        continue;
                    }
                    if (s.isEmpty()) {
                        s.add(id);
                    }
                    s.add(targetId);
                }
            }
            if (!s.isEmpty()) {
                reachable.add(s);
            }
        }

        return reachable;
    }

}
