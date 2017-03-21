using CSoM, Base.Test

data = Dict(
  # Frame(nels, nn, ndim, nst, nip, finite_element(nod, nodof))
  :struc_el => Frame(12, 10, 3, 1, 1, Line(2, 3)),
  :properties => [
    1.0 1.0e4 1.0e4 1.0 1.0 1.0 1.0e8;
     ],
  :gamma => [
    0.0, 0.0, 0.0, 0.0, 
    0.0, 0.0, 0.0, 0.0, 
    0.0, 0.0, 0.0, 0.0],
  :x_coords => [
    0.0, 1.0, 1.0, 2.0,
    2.0, 2.0, 3.0, 3.0,
    3.0, 3.0],
  :y_coords => [
    0.0, 0.0, 1.0, 0.0,
    1.0, 2.0, 0.0, 1.0,
    2.0, 3.0],
  :z_coords => [
    0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0,
    0.0, 0.0],
  :g_num => [
    1 2 2 3 4 5 4 5 6 7 8  9;
    2 3 4 5 5 6 7 8 9 8 9 10],
  :support => [
    (1, [0 0 0 0 0 0]),
    (3, [0 0 0 0 0 0]),
    (6, [0 0 0 0 0 0]),
    (10, [0 0 0 0 0 0])
    ],
  :loaded_nodes => [
    (7, [0.0 0.0 1.0 0.0 0.0 0.0])
    ],
  :limit => 200,
  :tol => 0.00001,
  :incs => 5,
  :dload => [0.5; 0.5; 0.5; 0.05; 0.05]
)

@time m = p4_5(data)

@test m[2] ≈ [0.0,0.0,0.0,0.0007322670153097881,-0.0007520032370654202,
  -0.00046008115273005434] atol=10.0*eps()
