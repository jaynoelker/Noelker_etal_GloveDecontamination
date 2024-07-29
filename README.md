# Noelker_etal_GloveDecontamination
**TITLE:** _Glove decontamination procedures to prevent pathogen and DNA cross-contamination among frogs_

This study describes procedures for decontaminating nitrile and cotton gloves when handling amphibians infected with _Batrachochytrium dendrobatidis_ (Bd).

James E. Noelker (Corresponding author: jaynoelker@gmail.com)

Vitoria Abreu Ruozzi

Hunter M. Craig

Jason P. Sckrabulis

Thomas R. Raffel (Principle investigator)

**CITATION:** Noelker, J. E., Abreu Ruozzi, V., Craig, H. M., Sckrabulis, J. P., & Raffel, T. R. (_2024_). Glove decontamination procedures to prevent pathogen and DNA cross-contamination among frogs. _Diseases of Aquatic Organisms_. https://doi.org/10.3354/dao03793

===========================================================================

**File 1:** _"Experiment1.2023.Culture.Decontamination.Test"_

CSV of data from Experiment 1 where gloves were decontaminated after being exposed to cultured Bd.

| Variable name | Description |
| --- | --- |
| **SwabID** | unique identifier for each swab sample taken from a particular glove |
| **BdZooEq** | Bd zoospore equivelents from each swab qPCR assay |
| **LnBdLoad** | log(Bd zoospore equivelents) after qPCR assay |
| **GloveType** | the type of glove sampled |
| **Treatment** | the treatment for each glove (1) Bd: positive control, (2) Control: negative control, (3) Autoclave: autoclave decontamination, (4) Wash: washing machine decontaminated, (5) BlAmRn: bleach-amquel-rinse decontamination, (6) Ethanol: ethanol decontamination |
| **Trial** | replicates for each decontamination trial from Experiment 1 |
| **Hand** | which hand each glove was worn on during Experiment 1 |

===========================================================================

**File 2:** _"Experiment2.2020.Frog.Bd.Glove.Decontamination"_

CSV of data from Experiment 2 where gloves were decontaminated after handling Bd infected Xenopus laevis.

| Variable name | Description |
| --- | --- |
| **Contam** | whether or not a given sample was contaminated from handling an infected frog |
| **FrogID** | unique identifier for each frog that was handled during the mesocosm experiment during which these swabs were taken |
| **GloveType** | the type of glove sampled|
| **DeconType** | method by which nitrile gloves were decontaminated after handling Bd infected X. laevis and removal of the cotton glove worn over the nitrile glove |
| **DeconStatus** | "Before" or "After" the decontamination procedure |
| **GloveBdZooEq** | Bd zoospore equivelents from each swab qPCR assay |
| **GloveLnBdLoad** | log(Bd zoospore equivelents) after qPCR assay from glove swabs |
| **FrogLnBdLoad** | log(Bd zoospore equivelents) after qPCR assay from frog swabs |
| **BdPositive** | whether a sample was considered positive (1) or negative (0) |

===========================================================================
