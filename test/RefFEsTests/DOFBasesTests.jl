module DOFBasesTests

using Test
using Gridap

fun(x) = x[1]+x[2]

D = 2
T = Float64
field = AnalyticalField(fun,D)

basis = MonomialBasis(T,(1,1))

polytope = Polytope(HEX_AXIS,HEX_AXIS)
nodes = NodesArray(polytope,[1,1])
dofbasis = LagrangianDOFBasis{D,T}(nodes.coordinates)

field_dofs = [0.0, 1.0, 1.0, 2.0]

basis_dofs = [
  1.0 0.0 0.0 0.0;
  1.0 1.0 0.0 0.0;
  1.0 0.0 1.0 0.0;
  1.0 1.0 1.0 1.0]

test_dof_basis(dofbasis,field,basis,field_dofs,basis_dofs)

T = VectorValue{2,Float64}

fun(x) = VectorValue(x[1]+x[2],x[1])

field = AnalyticalField(fun,D)
basis = MonomialBasis(T,(1,1))

nodes = NodesArray(polytope,[1,1])
dofbasis = LagrangianDOFBasis{D,T}(nodes.coordinates)

# # Component major
#field_dofs = [0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 2.0, 1.0]

# Node major
field_dofs = [0.0, 1.0, 1.0, 2.0, 0.0, 1.0, 0.0, 1.0]

# # Component major
#basis_dofs = [
#  1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
#  0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0;
#  1.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0;
#  0.0 1.0 0.0 1.0 0.0 0.0 0.0 0.0;
#  1.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0;
#  0.0 1.0 0.0 0.0 0.0 1.0 0.0 0.0;
#  1.0 0.0 1.0 0.0 1.0 0.0 1.0 0.0;
#  0.0 1.0 0.0 1.0 0.0 1.0 0.0 1.0]

# Node major
basis_dofs = [
  1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
  1.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0;
  1.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0;
  1.0 0.0 1.0 0.0 1.0 0.0 1.0 0.0;
  0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0;
  0.0 1.0 0.0 1.0 0.0 0.0 0.0 0.0;
  0.0 1.0 0.0 0.0 0.0 1.0 0.0 0.0;
  0.0 1.0 0.0 1.0 0.0 1.0 0.0 1.0]

test_dof_basis(dofbasis,field,basis,field_dofs,basis_dofs)

end # module
