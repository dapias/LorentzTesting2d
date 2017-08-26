using JLD

include("parameters.jl")
include("main.jl")

filename = randstring()



bt = billiard_rectangle(r, r; setting = "periodic")
d1 = Disk([0., 0.], a)
d2 = Disk([r, 0.], a)
d3 = Disk([0., r], a)
d4 = Disk([r, r], a)
dc = Disk([r/2, r/2], b)

push!(bt, dc, d1,d2,d3,d4)  #Billiard_table

r1 = dif_times(ts, n, bt)

save("$filename.jld", "final_pos", r1, "r",r,"a",a,"b",b, "times",ts,"n",10^5)

println("$filename.jld generated succesfully")
