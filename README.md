# Data for a first experiment in LLM-enhanced LPTP development


* Install [LPTP](https://github.com/FredMesnard/LPTP) locally
* Read and practice chapter 1 of the user manual
* Download the repository LPTP-LLM


## Proof-checking the proof files 

The following files can be proof-checked with LPTP:


-  `sqrt2_v0_main_gaps.pr`   
The initial proof file, with all gaps inside the main theorem.

-  `sqrt2_v1_lemmas_gaps.pr`     
All gaps in the proofs of the lemmas.

-  `sqrt2_v2_no_gap.pr`   
The final proof without any gap.

- `sqrt2_v3_epilog.pr`   
Back to Prolog: An LPTP proof that the initial Prolog query cannot succeed. 

The corresponding `*.tex` are TeX files (_not_ LaTeX files). 
They can be compiled into PDF files with the usual tools.
Check that the first line of these files is `\input proofmacros.tex`.
The file `proofmacros.tex`is included in the repository. 

The file `dependency-graph-sqrt2.png` presents a graphical view
of the depency graph of the whole proof.

## Applying ATPs to the proof files

* Install [Vampire](https://vprover.github.io) and [E](https://wwwlehre.dhbw-stuttgart.de/~sschulz/E/E.html) locally
* Install [SWI-Prolog](https://www.swi-prolog.org) locally

The Prolog `.pl` file + the LPTP proof `.pr` file are compiled into FOF syntax by a compiler available as `indp.pl`. 
The FOF syntax is a readable input format for most automated theorem provers.
The compiler creates as many files as lemmas appearing  in the proof file and runs Vampire and E on each lemma, with a timeout of 10 seconds for each prover. Please note that *the success rate may vary* depending on the local machine.
In the queries below, we admit about 100 properties coming from the LPTP libraries. They are considered as axioms.
We focus on the last properties, specific to our case-study.


- To run the ATPs for the last 9 properties of `sqrt2_v1_lemmas_gaps.pr`,
      
> % swipl -f indp.pl   
> Welcome to SWI-Prolog (threaded, 64 bits, version 10.0.0).  
> ...   
> ?- filename_last_fofs_run(9,'sqrt2_lemmas_gaps_ATP/sqrt2').    
> ...   

-  To run the ATPs for the last 24 properties `sqrt2_v2_no_gap.pr`

> ?- filename_last_fofs_run(24,'sqrt2_final_ATP/sqrt2').    
> ...   

-  To run the ATPs for the last 4 properties of `sqrt2_v3_epilog.pr`

> ?- filename_last_fofs_run(4,'sqrt2_epilog_ATP/sqrt2').   
> ...   

