
### Utility Functions needed for the construction of the Power System, mostly used for consistency checking ####

## Check that all the buses have a type defintion ##

function buscheck(buses)
    for b in buses
        if isnothing(b.bustype)
            @warn "Bus/Nodes data does not contain information to build an a network"
        end
    end
end

## Slack Bus Definition ##

function slack_bus_check(buses)
    slack = -9
    for b in buses
        if b.bustype == BusTypes.REF
            slack = b.number
            break
        end
    end
    if slack == -9
        @error "Model doesn't contain a slack bus"
    end
end

# TODO: Check for islanded Buses

# check for minimum timediff
function minimumtimestep(forecasts::Array{T}) where {T <: Forecast}
    if length(forecasts[1].data) > 1
        timeseries = forecasts[1].data
        n = length(timeseries) - 1
        ts = []
        for i in 1:n
            push!(
                ts,
                TimeSeries.timestamp(timeseries)[n + 1] -
                TimeSeries.timestamp(timeseries)[n],
            )
        end
        return minimum(ts)
    else
        ts = Dates.Dates.Minute(1)
        return ts
    end
end

function critical_components_check(sys::System)
    missing_critical_components = false
    critical_component_types = [Bus, Generator, ElectricLoad]
    for component_type in critical_component_types
        components = get_components(component_type, sys)
        if length(components) == 0
            @error("There are no $(component_type)s in the System")
            has_critical_components = true
        end
    end
    missing_critical_components &&
    throw(IS.InvalidValue("Critical Componeents are not present."))
end
