using Statistics
using GraphRecipes
using Plots




function directed_graph(n)
    A = zeros(n, n)
    for i in 1:n
        for j in 1:n
            if i == j
            else
                A[i, j] = rand(0:1)
            end
        end
    end
    return A
end


function undirected_graph(n)
    B = zeros(n, n)
    for i in 1:n
        for j in 1:i
            if i == j
            else
                num = rand(0:1)
                B[i, j] = num
                B[j, i] = num
            end
        end
    end
    return B
end

function from_edges(edge_matrix, n)
    A = zeros(n, n)
    node = 1
    for edge_vec in edge_matrix
        # println()
        # println("node : ", node)
        # println("vec : ",edge_vec)
        for edge in edge_vec
            # println("edge : ", edge)    
            A[node, edge] = 1
            A[edge, node] = 1
        end
        node += 1
    end
    return A
end

function show_graph(adj_matrix)
    graphplot(
        adj_matrix,
        names=1:size(adj_matrix)[1],
        markersize=0.2,
        nodeshape=:circle,)
end


show_graph(from_edges([[2],[3, 4, 5],[2],[2, 5, 6],[2, 4],[4]],6))
