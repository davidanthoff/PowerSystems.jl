#=
This file is auto-generated. Do not edit.
=#
"""
    mutable struct ThermalStandard <: ThermalGen
        name::String
        available::Bool
        status::Bool
        bus::Bus
        activepower::Float64
        reactivepower::Float64
        rating::Float64
        primemover::PrimeMovers.PrimeMover
        fuel::ThermalFuels.ThermalFuel
        activepowerlimits::Min_Max
        reactivepowerlimits::Union{Nothing, Min_Max}
        ramplimits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}
        timelimits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}
        op_cost::ThreePartCost
        services::Vector{Service}
        participation_factor::Float64
        time_at_status::Float64
        ext::Dict{String, Any}
        forecasts::InfrastructureSystems.Forecasts
        internal::InfrastructureSystemsInternal
    end

Data Structure for thermal generation technologies.

# Arguments
- `name::String`
- `available::Bool`
- `status::Bool`
- `bus::Bus`
- `activepower::Float64`, validation range: activepowerlimits, action if invalid: warn
- `reactivepower::Float64`, validation range: reactivepowerlimits, action if invalid: warn
- `rating::Float64`: Thermal limited MVA Power Output of the unit. <= Capacity, validation range: (0, nothing), action if invalid: error
- `primemover::PrimeMovers.PrimeMover`: PrimeMover Technology according to EIA 923
- `fuel::ThermalFuels.ThermalFuel`: PrimeMover Fuel according to EIA 923
- `activepowerlimits::Min_Max`
- `reactivepowerlimits::Union{Nothing, Min_Max}`
- `ramplimits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}`, validation range: (0, nothing), action if invalid: error
- `timelimits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}`: Minimum up and Minimum down time limits in hours, validation range: (0, nothing), action if invalid: error
- `op_cost::ThreePartCost`
- `services::Vector{Service}`: Services that this device contributes to
- `participation_factor::Float64`: AGC Participation Factor, validation range: (0, 1.0), action if invalid: error
- `time_at_status::Float64`
- `ext::Dict{String, Any}`
- `forecasts::InfrastructureSystems.Forecasts`: internal forecast storage
- `internal::InfrastructureSystemsInternal`: power system internal reference, do not modify
"""
mutable struct ThermalStandard <: ThermalGen
    name::String
    available::Bool
    status::Bool
    bus::Bus
    activepower::Float64
    reactivepower::Float64
    "Thermal limited MVA Power Output of the unit. <= Capacity"
    rating::Float64
    "PrimeMover Technology according to EIA 923"
    primemover::PrimeMovers.PrimeMover
    "PrimeMover Fuel according to EIA 923"
    fuel::ThermalFuels.ThermalFuel
    activepowerlimits::Min_Max
    reactivepowerlimits::Union{Nothing, Min_Max}
    ramplimits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}
    "Minimum up and Minimum down time limits in hours"
    timelimits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}
    op_cost::ThreePartCost
    "Services that this device contributes to"
    services::Vector{Service}
    "AGC Participation Factor"
    participation_factor::Float64
    time_at_status::Float64
    ext::Dict{String, Any}
    "internal forecast storage"
    forecasts::InfrastructureSystems.Forecasts
    "power system internal reference, do not modify"
    internal::InfrastructureSystemsInternal
end

function ThermalStandard(name, available, status, bus, activepower, reactivepower, rating, primemover, fuel, activepowerlimits, reactivepowerlimits, ramplimits, timelimits, op_cost, services=Device[], participation_factor=0.0, time_at_status=INFINITE_TIME, ext=Dict{String, Any}(), forecasts=InfrastructureSystems.Forecasts(), )
    ThermalStandard(name, available, status, bus, activepower, reactivepower, rating, primemover, fuel, activepowerlimits, reactivepowerlimits, ramplimits, timelimits, op_cost, services, participation_factor, time_at_status, ext, forecasts, InfrastructureSystemsInternal(), )
end

function ThermalStandard(; name, available, status, bus, activepower, reactivepower, rating, primemover, fuel, activepowerlimits, reactivepowerlimits, ramplimits, timelimits, op_cost, services=Device[], participation_factor=0.0, time_at_status=INFINITE_TIME, ext=Dict{String, Any}(), forecasts=InfrastructureSystems.Forecasts(), )
    ThermalStandard(name, available, status, bus, activepower, reactivepower, rating, primemover, fuel, activepowerlimits, reactivepowerlimits, ramplimits, timelimits, op_cost, services, participation_factor, time_at_status, ext, forecasts, )
end

# Constructor for demo purposes; non-functional.
function ThermalStandard(::Nothing)
    ThermalStandard(;
        name="init",
        available=false,
        status=false,
        bus=Bus(nothing),
        activepower=0.0,
        reactivepower=0.0,
        rating=0.0,
        primemover=PrimeMovers.OT,
        fuel=ThermalFuels.OTHER,
        activepowerlimits=(min=0.0, max=0.0),
        reactivepowerlimits=nothing,
        ramplimits=nothing,
        timelimits=nothing,
        op_cost=ThreePartCost(nothing),
        services=Device[],
        participation_factor=0.0,
        time_at_status=INFINITE_TIME,
        ext=Dict{String, Any}(),
        forecasts=InfrastructureSystems.Forecasts(),
    )
end


InfrastructureSystems.get_name(value::ThermalStandard) = value.name
"""Get ThermalStandard available."""
get_available(value::ThermalStandard) = value.available
"""Get ThermalStandard status."""
get_status(value::ThermalStandard) = value.status
"""Get ThermalStandard bus."""
get_bus(value::ThermalStandard) = value.bus
"""Get ThermalStandard activepower."""
get_activepower(value::ThermalStandard) = value.activepower
"""Get ThermalStandard reactivepower."""
get_reactivepower(value::ThermalStandard) = value.reactivepower
"""Get ThermalStandard rating."""
get_rating(value::ThermalStandard) = value.rating
"""Get ThermalStandard primemover."""
get_primemover(value::ThermalStandard) = value.primemover
"""Get ThermalStandard fuel."""
get_fuel(value::ThermalStandard) = value.fuel
"""Get ThermalStandard activepowerlimits."""
get_activepowerlimits(value::ThermalStandard) = value.activepowerlimits
"""Get ThermalStandard reactivepowerlimits."""
get_reactivepowerlimits(value::ThermalStandard) = value.reactivepowerlimits
"""Get ThermalStandard ramplimits."""
get_ramplimits(value::ThermalStandard) = value.ramplimits
"""Get ThermalStandard timelimits."""
get_timelimits(value::ThermalStandard) = value.timelimits
"""Get ThermalStandard op_cost."""
get_op_cost(value::ThermalStandard) = value.op_cost
"""Get ThermalStandard services."""
get_services(value::ThermalStandard) = value.services
"""Get ThermalStandard participation_factor."""
get_participation_factor(value::ThermalStandard) = value.participation_factor
"""Get ThermalStandard time_at_status."""
get_time_at_status(value::ThermalStandard) = value.time_at_status
"""Get ThermalStandard ext."""
get_ext(value::ThermalStandard) = value.ext

InfrastructureSystems.get_forecasts(value::ThermalStandard) = value.forecasts
"""Get ThermalStandard internal."""
get_internal(value::ThermalStandard) = value.internal


InfrastructureSystems.set_name!(value::ThermalStandard, val) = value.name = val
"""Set ThermalStandard available."""
set_available!(value::ThermalStandard, val) = value.available = val
"""Set ThermalStandard status."""
set_status!(value::ThermalStandard, val) = value.status = val
"""Set ThermalStandard bus."""
set_bus!(value::ThermalStandard, val) = value.bus = val
"""Set ThermalStandard activepower."""
set_activepower!(value::ThermalStandard, val) = value.activepower = val
"""Set ThermalStandard reactivepower."""
set_reactivepower!(value::ThermalStandard, val) = value.reactivepower = val
"""Set ThermalStandard rating."""
set_rating!(value::ThermalStandard, val) = value.rating = val
"""Set ThermalStandard primemover."""
set_primemover!(value::ThermalStandard, val) = value.primemover = val
"""Set ThermalStandard fuel."""
set_fuel!(value::ThermalStandard, val) = value.fuel = val
"""Set ThermalStandard activepowerlimits."""
set_activepowerlimits!(value::ThermalStandard, val) = value.activepowerlimits = val
"""Set ThermalStandard reactivepowerlimits."""
set_reactivepowerlimits!(value::ThermalStandard, val) = value.reactivepowerlimits = val
"""Set ThermalStandard ramplimits."""
set_ramplimits!(value::ThermalStandard, val) = value.ramplimits = val
"""Set ThermalStandard timelimits."""
set_timelimits!(value::ThermalStandard, val) = value.timelimits = val
"""Set ThermalStandard op_cost."""
set_op_cost!(value::ThermalStandard, val) = value.op_cost = val
"""Set ThermalStandard services."""
set_services!(value::ThermalStandard, val) = value.services = val
"""Set ThermalStandard participation_factor."""
set_participation_factor!(value::ThermalStandard, val) = value.participation_factor = val
"""Set ThermalStandard time_at_status."""
set_time_at_status!(value::ThermalStandard, val) = value.time_at_status = val
"""Set ThermalStandard ext."""
set_ext!(value::ThermalStandard, val) = value.ext = val

InfrastructureSystems.set_forecasts!(value::ThermalStandard, val) = value.forecasts = val
"""Set ThermalStandard internal."""
set_internal!(value::ThermalStandard, val) = value.internal = val