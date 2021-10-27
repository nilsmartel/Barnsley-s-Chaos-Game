# Note: every time I mention triangles here, I mean equilateral triangles
using Plots

height = √(0.5^2 + 1^2)

function randomPointInTriangle()
    p = rand(2)
    
    # transform p a little, so that it's guaranteed to sit inside an triangle
    x = p[1]
    y = p[2]
    x *= (1-y)
    x += 0.5
    y *= height
    [x, y]
end

# Vertecise of an equilateral triangle
triangle = [
    [-0.5,0],
    [0.5,0],
    [0,height],
]

ITERATIONS = 10000

# choose a random points inside the triangle
p = randomPointInTriangle()

list = []

# on each iteration move it randomly halfway to some random vert
# of it's surrounding triangle
for i in 1:ITERATIONS
    # pick a random vert
    v = rand(triangle)

    # move p halfway to the new point
    p += v
    p *= 0.5

    # save p
    push!(list, p)
end


xcoords = list .|> first
ycoords = list .|> (p) -> p[2]
Plots.plot(x = xcoords, y = ycoords);