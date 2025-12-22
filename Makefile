
SIM = sim.out
VCD = dump.vcd

# Default: compile and run
all: run

# Compile all .v files in the folder
$(SIM): *.v
	iverilog -g2012 -o $(SIM) *.v

# Run the simulation
run: $(SIM)
	vvp $(SIM)

# View waveform (install gtkwave first if needed)
view:
	gtkwave $(VCD)

# Clean up
clean:
	rm -f $(SIM) $(VCD)

.PHONY: all run view clean