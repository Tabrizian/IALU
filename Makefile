#
#VHDL files
SRCDIR = src
FILES = $(SRCDIR)/and_eight.vhd $(SRCDIR)/carry_look_ahead.vhd \
		$(SRCDIR)/controller.vhd $(SRCDIR)/full_adder.vhd \
		$(SRCDIR)/half_adder.vhd $(SRCDIR)/quarter_subtractor.vhd \
		$(SRCDIR)/multiplier_four.vhd $(SRCDIR)/or_eight.vhd \
		$(SRCDIR)/pi_gi_generator.vhd $(SRCDIR)/pi_gi_generator_8.vhd \
		$(SRCDIR)/xnor_eight.vhd $(SRCDIR)/select_subtractor.vhd \
		$(SRCDIR)/xor_eight.vhd $(SRCDIR)/cla.vhd \
		$(SRCDIR)/full_subtractor.vhd $(SRCDIR)/divider_eight.vhd

# Testbench
TESTDIR = test
TESTFILES = $(TESTDIR)/carry_look_ahead_tb.vhd $(TESTDIR)/cla_tb.vhd \
			$(TESTDIR)/full_subtractor_tb.vhd  $(TESTDIR)/divider_eight_tb.vhd\
		   	$(TESTDIR)/select_subtractor_tb.vhd
SUFFIX = _out# Suffix of files created using -e option
MODULE = divider_eight_tb# Show wave of this module
STOPTIME = 3500ns

# Run
RUN_FLAGS = --stop-time=$(STOPTIME) --vcd=$(MODULE).vcd

# GHDL command
GHDL_CMD = ghdl
GHDL_FLAGS = -fexplicit --ieee=synopsys

all: | ghdl-compile ghdl-simulate show

ghdl-compile: $(FILES) $(TESTFILES)
	$(GHDL_CMD) -a $(GHDL_FLAGS) $(FILES) $(TESTFILES)
clean:
	rm *.o work-obj93.cf *.vcd *$(SUFFIX)
ghdl-simulate:
	$(GHDL_CMD) -e -o $(MODULE)$(SUFFIX) $(MODULE)
show:
	$(GHDL_CMD) -r $(MODULE)$(SUFFIX) $(RUN_FLAGS)
	gtkwave $(MODULE).vcd
