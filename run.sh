
#set -x

# XXX Replace with your location.
KASIM=/home/xl0/work/CRI/M1/compbio2/KaSim/KaSim


function run_q1 {
	echo "Running for Q1..."

	for K in 100 500 1000; do
		echo "For K = $K"

		echo "%init: $K K(s)" > init.ka

		rm -f "q1_$K.out"
		$KASIM -i ES_q1.ka -i init.ka -o "q1_$K.out" -t 10000 -p 10000
		rm -f init.ka
	done
}

function run_q2 {
	echo "Running for Q2"
	for K in 100 500 1000; do
		echo "For K = $K"

		echo "%init: $K K(s)" > init.ka

		rm -f "q2_$K.out"
		$KASIM -i ES_q2.ka -i init.ka -o "q2_$K.out" -t 10000 -p 10000
		rm -f init.ka
	done
}

function run_q3 {
	echo "Running for Q3"
	for P in 0 50 60 70 80 90 100 110 120 130 140 150; do
		echo "For P = $P"

		echo "%init: 100 K(s)" > init.ka
		echo "%init: $P P(s)" >> init.ka

		rm -f "q3_$P.out"
		$KASIM -i ES_q3.ka -i init.ka -o "q3_$P.out" -t 30000 -p 30000
		rm -f init.ka
	done
}

run_q1
run_q2
run_q3
