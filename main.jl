using DynamicalBilliards
#DynamicalBilliards.enableplotting()

bt = billiard_rectangle(r, r; setting = "periodic")
d1 = Disk([0., 0.], a)
d2 = Disk([r, 0.], a)
d3 = Disk([0., r], a)
d4 = Disk([r, r], a)
dc = Disk([r/2, r/2], b)

push!(bt, dc, d1,d2,d3,d4)  #Billiard_table

function uniform_simulation(n::Int, table::Array{DynamicalBilliards.Obstacle,1}, t::AbstractFloat)
    res = zeros(n)
    for i in 1:n
        p = randominside(table) #Particle
        xt, yt, vxt, vyt, t_colision = construct(evolve!(p, table, t)...)
        r = ((xt - xt[1]).^2 .+ (yt - yt[1]).^2).^0.5
        res[i] = r[end]
    end
    res
end

function dif_times(times::Array, n::Int, table::Array{DynamicalBilliards.Obstacle,1})
    dist = zeros(n, length(times))
    j = 1
    for i in times
        dist[:,j] = uniform_simulation(n, table, i)
        j += 1
    end
    dist
end
            
        
    

    
