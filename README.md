# Noelker_etal_GloveDecontamination
This study describes procedures for decontaminating nitrile and cotton gloves when handling amphibians potentially infected with Batrachochytrium dendrobatidis (Bd).

TITLE: Glove decontamination procedures to prevent pathogen and DNA cross-contamination among frogs

James E. Noelker (Corresponding author: jaynoelker@gmail.com)

Vitoria Abreu Ruozzi1

Hunter M. Craig

Jason P. Sckrabulis

Thomas R. Raffel (Principle investigator)

File 1: "Experiment1.2023.Culture.Decontamination.Test"
CSV of data from Experiment 1 where gloves were decontaminated after being exposed to cultured Bd.
Column names:
SwabID: unique identifier for each swab sample taken from a particular glove
LnBdLoad: log(Bd zoospore equivelents) after qPCR assay
GloveType: the type of glove sampled
Treatment: the treatment for each glove (1) Bd: positive control, (2) Control: negative control, (3) Autoclave: autoclave decontamination, (4) Wash: washing machine decontaminated, (5) BlAmRn: bleach-amquel-rinse decontamination, (6) Ethanol: ethanol decontamination
Trial: replicates for each decontamination trial from Experiment 1
Hand: which hand each glove was worn on during Experiment 1

File 2: "Experiment2.2020.Frog.Bd.Glove.Decontamination"
CSV of data from Experiment 2 where gloves were decontaminated after handling Bd infected Xenopus laevis.
Column names:
Contam: whether or not a given sample was contaminated from handling an infected frog
FrogID: unique identifier for each frog that was handled during the mesocosm experiment during which these swabs were taken
GloveType: the type of glove sampled
DeconType: method by which nitrile gloves were decontaminated after handling Bd infected X. laevis and removal of the cotton glove worn over the nitrile glove
DeconStatus: "Before" or "After" the decontamination procedure
GloveBdZooEq: Bd zoospore equivelents from each swab qPCR assay
GloveLnBdLoad: log(Bd zoospore equivelents) after qPCR assay from glove swabs
FrogLnBdLoad: log(Bd zoospore equivelents) after qPCR assay from frog swabs
BdPositive: whether a sample was considered positive (1) or negative (0)
