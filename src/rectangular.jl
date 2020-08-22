"""
This module contains standard shape point mesh functions.
"""

export rectangular, square

"""
    rectangular(lattice::Array{T,1}, N::Array{I,1})

Create a rectangular point mesh.
"""
function rectangular(lattice::Array{T,1}, N::Array{I,1}) where {T<:Real, I<:Int}
    mesh = zeros(3,prod(N))
    a = 1
    for i in 1:N[1]
        for j in 1:N[2]
            for k in 1:N[3]
                mesh[1,a] = i*lattice[1]
                mesh[2,a] = j*lattice[2]
                mesh[3,a] = k*lattice[3]
                a += 1
            end
        end
    end
    return mesh
end


"""
    square(lattice::T, N::I)

Create a square point mesh.
"""

function square(lattice::T, N::I) where {T<:Real, I<:Int}
    return rectangular([lattice, lattice, lattice], [N, N, N])
end
