```@meta
EditURL = "<unknown>/docs/src/user_guide/quick_start_guide.jl"
```

# Quick Start Guide

`PowerSystems.jl` is structured to enable intuitive data creation scripts, flexible interfaces
for data intake and straight forward extension of the data model. These features are enabled
through three main features:

- Abstract type hierarchy,
- Optimized read/write data container (the container is called `System`),
- Utilities to facilitate modeling, extensions, and integration.

You can access example data in the [Power Systems Test Data Repository](https://github.com/NREL-SIIP/PowerSystemsTestData)
the data can be downloaded with the submodule `UtilsData`

## Loading data

Code can be loaded from Matpower files and return a summary of the system's components and
time-series

```@repl generated_quick_start_guide
using PowerSystems
DATA_DIR = download(PowerSystems.UtilsData.TestData, folder = pwd())
system_data = System(joinpath(DATA_DIR, "matpower/RTS_GMLC.m"))
```

-----

## Using `PowerSystems.jl` for modeling

This example function implements a function where the modeler can choose the technology
by its type and use the different implementations of [`get_max_active_power`](@ref). **Using
the "dot" access to get a parameter value from a device is actively discouraged, use "getter" functions instead**

Refer to [Modeling with JuMP](ref) for a more detailed use of `PowerSystems.jl` to develop
a model

```@example generated_quick_start_guide
function installed_capacity(system::System; technology::Type{T} = Generator) where T <: Generator
    installed_capacity = 0.0
    for g in get_components(T, system)
        installed_capacity += get_max_active_power(g)
    end
    return installed_capacity
end
```

total installed capacity

```@example generated_quick_start_guide
installed_capacity(system_data)
```

installed capacity of the thermal generation

```@example generated_quick_start_guide
installed_capacity(system_data; technology = ThermalStandard)
```

installed capacity of renewable generation

```@example generated_quick_start_guide
installed_capacity(system_data; technology = RenewableGen)
```

-----

## Adding Time Series data to a system

`PowerSystems.jl` provides interfaces to augment the data sets already created. You can also add time series data to a sytem from a CSV file or from several CSV files, more
details in [`Time Series Data`](@ref). This example implements [`SingleTimeSeries`](@ref)

```@example generated_quick_start_guide
using PowerSystems
using TimeSeries
using CSV
const PSY = PowerSystems
DATA_DIR = download(PSY.UtilsData.TestData, folder = pwd())
system = System(joinpath(DATA_DIR, "matpower/case5.m"))

new_renewable = RenewableDispatch(
        name = "WindBusA",
        available = true,
        bus = get_component(Bus, system, "3"),
        active_power = 2.0,
        reactive_power = 1.0,
        rating = 1.2,
        prime_mover = PrimeMovers.WT,
        reactive_power_limits = (min = 0.0, max = 0.0),
        base_power = 100.0,
        operation_cost = TwoPartCost(22.0, 0.0),
        power_factor = 1.0
    )

add_component!(system, new_renewable)

csv_data = CSV.read(joinpath(DATA_DIR,"forecasts/5bus_ts/gen/Renewable/WIND/da_wind5.csv"))
time_series_data_raw = TimeArray(csv_data, timestamp=:TimeStamp)
time_series = SingleTimeSeries(name = "active_power", data = time_series_data_raw)

#Add the forecast to the system and component
add_time_series!(system, new_renewable, forecast)

#Load forecasts from pointers file
#FORECASTS_DIR = joinpath("src", "forecasts/5bus_ts")
#fname = joinpath(FORECASTS_DIR, "timeseries_pointers_load.json")
#add_time_series!(system, fname)
```