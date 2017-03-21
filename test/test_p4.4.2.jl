using CSoM, Base.Test

data = Dict(
  # Frame(nels, nn, ndim, nst, nip, finite_element(nod, nodof))
  :struc_el => Frame(3, 4, 3, 1, 1, Line(2, 3)),
  :properties => [
    4.0e6 1.0e6 0.3e6 0.3e6],
  :x_coords => [0.0, 5.0, 5.0, 5.0],
  :y_coords => [5.0, 5.0, 5.0, 0.0],
  :z_coords => [5.0, 5.0, 0.0, 0.0],
  :gamma => [0.0, 0.0, 90.0],
  :g_num => [
    1 3 4;
    2 2 3],
  :support => [
    (1, [0 0 0 0 0 0]),
    (4, [0 0 0 0 0 0])
    ],
  :loaded_nodes => [
    (2, [0.0 -100.0 0.0 0.0 0.0 0.0])]
)

@time m = p4_4(data)

@test round.(m.actions[:, 3], 3) == [
  -2.431, 36.287, 27.539, 24.027, 9.49, 80.616,
  2.431, -36.287, -27.539, 113.666, -9.49, -68.461
]
