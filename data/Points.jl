module Points

import LinearAlgebra  # для добавления метода к скалярному произведению

export dist
export Point

struct Point{T}
    x::T
    y::T
end

dist(p::Point) = sqrt(p.x^2 + p.y^2)
random_point() = Point(rand(2)...)

# Добавление метода к скалярному произведению LinearAlgebra.dot
LinearAlgebra.dot(p1::Point, p2::Point) = p1.x * p2.x + p1.y * p2.y

# Расширяение стандартной библиотеки языка, модуля Base
# `+` коммутативно
Base.:+(p1::Point, p2::Point) = Point(p1.x + p2.x, p1.y + p2.y)
# `*` не коммутативно
Base.:*(α::Number, p::Point) = Point(α * p.x, α * p.y)
Base.:*(p::Point, α::Number) = α * p

end # module