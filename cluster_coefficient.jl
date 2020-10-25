using ColorSchemes
show_image(M) = get.([ColorSchemes.bamako], M./(maximum(M)+1e-6))
using Random
using Statistics
using GraphRecipes
using Plots
include("graphs.jl")



A = undirected_graph(rand(6:20))
# A = [0 1 1 1 1; 1 0 1 1 1; 1 1 0 1 1; 1 1 1 0 1; 1 1 1 1 0] #=> CC : 1.0
# A = [0 0 0 0;0 0 0 1;0 0 0 1;0 1 1 0] #=> CC : 0.0

Ax = size(A)[1] 
Ay = size(A)[2]
@assert Ax == Ay

Cs = zeros(0)
for j in 1:Ay
    connected_j = 0
    for i in 1:Ax
        search_el = A[j, i]
        if search_el != 0
            search_key = i
            connected_j += A[search_key, :]'*A[j, :]# これは二方向で数えているので、無向グラフでは二倍になっている。
        end
    end
    j_edges = sum(A[j , :])
    cluster_j = connected_j/(j_edges*(j_edges-1)+1e-6)# なので、ここでは分子に掛けるはずの2を掛けない
    push!(Cs, cluster_j)
    # println("node : ", j)
    # println("edges ====> ", j_edges)
    # println("cc =======> ", cluster_j)
    # println()
end

println("Cluster value for each node = ",Cs)
println("Cluster value for graph = ", round(mean(Cs), digits=3))



gr();
graphplot(A,
    names=1:Ax,
    marker_color=show_image(Cs),
    markersize=0.2,
    nodeshape=:circle,
#     arrow=:arrow, 
    )
savefig("graph.png")