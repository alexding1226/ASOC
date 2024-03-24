
# Loop constraints
directive set /fir/run/run:rlp CSTEPS_FROM {{. == 1}}
directive set /fir/run/run:rlp/main CSTEPS_FROM {{. == 3} {.. == 1}}

# IO operation constraints
directive set /fir/run/run:rlp/main/addr:io_read(coeff_addr) CSTEPS_FROM {{.. == 0}}
directive set /fir/run/run:rlp/main/SHIFT-8:if:io_read(input) CSTEPS_FROM {{.. == 0}}
directive set /fir/run/run:rlp/main/io_write(output) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints
directive set /fir/run/run:rlp/main/MAC:read_mem(coeffs:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/MAC-7:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC-8:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC-5:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC-6:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC:acc#7 CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC:acc#10 CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC-3:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC-4:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC:acc#6 CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC-1:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC-2:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC:acc#9 CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC:acc CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/MAC-8:acc#2 CSTEPS_FROM {{.. == 2}}

# Probe constraints
