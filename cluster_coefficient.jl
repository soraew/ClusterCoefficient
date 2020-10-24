using ColorSchemes
show_image(M) = get.([ColorSchemes.leonardo], M.+0.5)
using Random
using Statistics
using GraphRecipes
using Plots
include("graphs.jl")



A = undirected_graph(rand(10:20))
# A = A_case
# A = [0 1 1 1 1; 1 0 1 1 1; 1 1 0 1 1; 1 1 1 0 1; 1 1 1 1 0]
# A = [0 0 0 0;0 0 0 1;0 0 0 1;0 1 1 0]
Ax = size(A)[1] 
Ay = size(A)[2]
@assert Ax == Ay

I = Vector{Int}[]
for i in 1:Ay
    J = zeros(0)
    for j in 1:Ax
        if A[j, i] != 0
            push!(J, j)
        end
    end
    if ~isassigned(J, 1)
        push!(I, [0])
    else
        push!(I, J) 
    end
end

# println("edges array =>     ", I)


Cs = zeros(0)
for i in 1:length(I)
    search_list_elements = zeros(0)
    if length(I[i]) >= 2
        for search_key in I[i]
            if search_key != 0
                search_list_i = I[search_key]
                for item in search_list_i
                    push!(search_list_elements, item)
                end
            end
        end
        connected  = 0
        k = length(I[i])
        for j in I[i]
            connected+= count(x->(x==j), search_list_elements)#これは二方向で数えているので、無向グラフでは二倍になっている。
        end

#         println("edges from node : ",k)
#         println("connected       : ",connected)
#         println("cluster_val     : ", cluster_val)

        cluster_val = connected/(k*(k-1)+1e-6)#なので、ここでは分子に掛けるはずの2を掛けない
    else
        cluster_val = 0.0
    end
    cluster_val = round(cluster_val, digits=3)
    push!(Cs, cluster_val)
end
println("Cluster value for each node = ",Cs)
println("Cluster value for graph = ", round(mean(Cs), digits=3))

idx = size(A)[1]
graphplot(A,
    names=1:idx,
    marker_color=show_image(Cs),
    markersize=0.2,
    nodeshape=:circle,
#     arrow=:arrow, 
    )
