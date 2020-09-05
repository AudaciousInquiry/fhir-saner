The SANER Project envisions a system architecture comprised of small, easily deliverable
components that can be used together to support deployment of reporting, analysis,
alerting and data aggregation tools to support fast deployment of solutions supporting
public health situation awareness.

## Major Components
The major design components described by this guide support the following functions:

* Reporting - Generates the data to be reported and make it available.
* Presentation - Analyzes and display data.
* Adaptation - Adapts between systems
* FHIR Server - A FHIR Server is an obvious component in a FHIR based implementation guide.
* External Storage - Stores data for later access.

These functions are described in more detail in the sections below.

### Reporting
The reporting component is responsible for reporting utilization data known by an
authoritative system in the hospital. There may be multiple authoritative systems
for different kinds of reporting data.  A reporting component will create FHIR Measurement
Reports documenting the measures that are known to the authoritative system.  These
reports will be collected in some form of centralized storage or transmission solution.
That solution could be as simple as a file system, or more complex (e.g., using
cloud-based storage), and could involve different protocols, including S3, Azure Blob
Storage, SFTP, or FHIR RESTful APIs and a FHIR Server.

In this guide, the Reporting component is implemented by the [Measure Source](actors.html#measure-source) actor.

### Presentation
The presentation component selects some subset of available data and presents it to
end users providing those users with the ability to interpret and act on the presented
information.  These components may generate maps showing hot spots based on some aspect
of the measured data, charts and annotations of recent trends (e.g., current values
plus projections over time), or other visualizations.

In this guide, the Presentation component is implemented by the [Measure Consumer](actors.html#measure-consumer) actor.

### Adapters
Adapters bridge systems lacking certain capabilities with other systems requiring
those capabilities, much like a ground adapter does with two pronged electrical outlet.

In this guide, the Adapter component is implemented by the [Measure Intermediary](actors.html#measure-intermediary) actor.

### FHIR Server
Several off the shelf FHIR Server components exist which can be stood up in a data center
or in the cloud to provide functionality that supports the FHIR Project.  [HAPI on FHIR](https://hapifhir.io/) is
a Java-based FHIR Server that is at the core of the [Smile CDR](https://smilecdr.com/) commercial
offering.  Microsoft offers the [Azure API for FHIR](https://azure.microsoft.com/en-us/services/azure-api-for-fhir/#overview).  Firely offers
[Vonk](https://fire.ly/products/vonk) which has both a free community edition and a commercial product.
HL7 offers a page filled with [Open Source FHIR Server](https://wiki.hl7.org/Open_Source_FHIR_implementations)
(and client) implementation software.

The figure below shows a FHIR Server acting as an Intermediary between a Hospital and Public Health

![FHIR Server](FHIRServer.svg)

However, a Hospital could simply configure it's own FHIR Server, and Public Health could then pull the data they need from it.

![PublicHealthPullFromHospital](PublicHealthPullFromHospital.svg)

Or, Public Health can configure it's own FHIR Server, and a Hospital can push the data to it.

![HospitalPushToPublicHealth](HospitalPushToPublicHealth.svg)

### External Storage
Deployments can also use external storage, for example a file system, message queue, S3 bucket, Azure Blob Storage, SFTP, or even Direct Messaging
to exchange data.  In the figure below, a hospital pushes data to its own external storage, and public health pulls data from it.

![Hospital Pushes To its own External Storage](PublicHealthPullFromHospitalStorage.svg)


But a hospital might as easily push data to public health's external storage system.

![Hospital Pushes To Public Health Agency's External Storage](HospitalPushToPublicHealthStorage.svg)


## Deployment
System components are designed such that they can be individually deployed and configured.

The following diagrams depict several different deployments with different responsibilties owned by a Hospital or Public Health Agency

### Hospital Supported Infrastructure

![Hospital Supported Infrastructure](HospitalPushToExternalStorageAdaptedToPullAPI-0.svg)


### Middle of the Road

![Middle of the Road](HospitalPushToExternalStorageAdaptedToPullAPI-1.svg)


### Public Health Supported Infrastructure

![Public Health Supported Infrastructure](HospitalPushToExternalStorageAdaptedToPullAPI-2.svg)

