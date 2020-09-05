This section describes the REPORT-TX of this guide. This transaction is used by the Measure Consumer actors.

### Scope

The Communicate Results transaction allows users (e.g., Public Health Officials) to view current resource availability,
or other systems to access resource availability data.


### Actors Roles

![Figure 2.5-1: Communicate Results Use Case Diagram](transaction-5-uc.svg "Figure 2.5-1: Communicate Results Use Case Diagram")

**Figure 2.5-1: Communicate Results Use Case Diagram**

<table border='1' borderspacing='0'>
<caption><b>Table 2.5-1: Actor Roles</b></caption>
<thead><tr><th>Actor</th><th>Role</th></tr></thead>
<tbody><tr><td><a href="actors.html#measure-consumer">Measure Consumer</a></td>
<td>Display or transmits reports using availability data</td>
</tr>
        
</tbody>
</table>

### Referenced Standards

<table border='1' borderspacing='0'>
<caption><b>Table 3.71.3-1: Referenced Standards</b></caption>
<thead><tr><th>Standard</th><th>Name</th></tr></thead>
<tbody>
            <tr><td>RFC-7230</td><td><a href='https://ietf.org/rfc/rfc7230.html'>Hypertext Transfer Protocol - HTTP/1.1</a></td></tr>
        
</tbody>
</table>

### Interactions
        
![Figure 2.5-2: Communicate Results Interactions](transaction-5-seq.svg "Figure 2.5-2: Communicate Results Interactions")

**Figure 2.5-2: Communicate Results Interactions**


#### Communicate Measure


Upon completion of this transaction, resource availability data will have been communicated to a
user or system. This can be demonstrated by generation of a report, summary, or other artifact, or by transmission of resource
availability data or some computation over it to another system.
            


This requirement can be met by a Measure Consumer that consumes and displays data in a Web Browser, consumes data
            and transmits it in another format to a public health agency (e.g., using the CDC CSV format), or as a Measure
            Intermediary that consumes data from one system and communicates it to another, or transforms it and communicates it back
            to the original system or to another system.
            


##### Trigger Event - 

##### Message Semantics

##### Expected Actions


### Conformance
See the following CapabilityStatement resources for conformance requirements:

        