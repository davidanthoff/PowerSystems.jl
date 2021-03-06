# ## Type Structure

# The storage of power system data has traditionally been done with general use tables based on the power flow problem. However, tables are not inherently designed to store data with mixed data representations or hierarchal structures. This limitation was addressed in the early 1990's with the advent of automation, spurred by increasingly complex data needs for power systems operations. The industry required standardized models to exchange larger and more complex sets of information, and so resorted to an object-oriented data model. The CIM was developed and later made a standard maintained by the IEC - Technical Committee 57 Working Group 13. The aim was to provide a standard definition for power system components that could be used in automated EMS and asset-management databases.

# From the computer engineering point-of-view, using tables would require to re-write a lot of code. In most languages with strongly type hierarchies, using a tree structure it is advantageous. This is particularly relevant for code re-use and data encapsulation. Collecting all potential devices is not possible; neither is it desirable. However, it is necessary to have the capability to extend the data model such that different user can store their data in an organized ontology.

# Each device in PowerSystems.jl is defined using a Julia structure embedded in a type hierarchy. This implementation enables the categorization of the devices by their operational characteristics and the data required to model them. The type-based and method-forward paradigm in PowerSystems.jl incentivizes code re-use in modeling, enhances the reproducibility of code, and enables modularization for specific data types.
