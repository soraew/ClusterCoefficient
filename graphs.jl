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