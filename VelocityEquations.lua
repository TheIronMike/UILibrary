--
-- Adapted from
-- Tweener's easing functions (Penner's Easing Equations)
-- and http://code.google.com/p/tweener/ (jstweener javascript version)
-- and Emmanuel Oga (https://github.com/EmmanuelOga/easing)
--
-- Written because his were weird. No offense.

-- A = init
-- B = final
-- T = time

local Pow = math.pow
local Root = math.sqrt

local Pi = math.pi
local Sin = math.sin
local Cos = math.cos

-- General Equation
local function Linear(A, B, T)
    local C = (B - A)
    return A + C * T
end

-- In Equations
local function In_Quad(A, B, T)
    local C = (B - A)
    return C * Pow(T, 2) + A
end

local function In_Cubic(A, B, T)
    local C = (B - A)
    return C * Pow(T, 3) + A
end

local function In_Quart(A, B, T)
    local C = (B - A)
    return C * Pow(T, 4) + A
end

local function In_Quint(A, B, T)
    local C = (B - A)
    return C * Pow(T, 5) + A
end

local function In_Sine(A, B, T)
    local C = (B - A)
    return (-C * Cos(T * (Pi/2))) + C + A
end

local function In_Exponential(A, B, T)
    local C = (B - A)
    if T == 0 then return A end
    return C * Pow(2, 10 * (T - 1) + A - (C*0.001))
end

local function In_Circular(A, B, T)
    local C = (B - A)
    return (-C * (Root(1 - Pow(T, 2)) - 1) + A)
end

-- Out
local function Out_Quad(A, B, T)
    local C = (B - A)
    return -C * T * (T - 2) + A
end

local function Out_Cubic(A,B,T)
    local C = (B - A)
    T = T - 1
    return C * (Pow(T, 3) + 1) + A
end

local function Out_Quart(A, B, T)
    local C = (B - A)
    T = T - 1
    return -C * (Pow(T, 4) - 1) + A
end

local function Out_Quint(A, B, T)
    local C = (B - A)
    T = T - 1
    return C * (Pow(T, 5) + 1) + A
end

local function Out_Sine(A, B, T)
    local C = (B - A)
    return C * Sin(T / (Pi/2)) + A
end

local function Out_Exponential(A, B, T)
    local C = (B - A)
    if T == 1 then return A + C end
    return C * 1.001 * (-Pow(2, -10 * T) + 1) + A
end

local function Out_Circular(A, B, T)
    local C = (B - A)
    T = T - 1
    return C * Root(1 - Pow(T, 2)) + A
end

return {
    Linear = Linear,
    -- In
    In_Quad = In_Quad,
    In_Cubic = In_Cubic,
    In_Quart = In_Quart,
    In_Quint = In_Quint,
    In_Sine = In_Sine,
    In_Exponential = In_Exponential,
    In_Circular = In_Circular,

    -- Out
    Out_Quad = Out_Quad,
    Out_Cubic = Out_Cubic,
    Out_Quart = Out_Quart,
    Out_Quint = Out_Quint,
    Out_Sine = Out_Sine,
    Out_Exponential = Out_Exponential,
    Out_Circular = Out_Circular
}
