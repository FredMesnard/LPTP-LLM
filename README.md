# Data for a first experiment in LLM-enhanced LPTP development


* Install [LPTP](https://github.com/FredMesnard/LPTP) locally
* Read and practice chapter 1 of the user manual
* Download the repository LPTP-LLM


## Proof-checking the proof files 

The following files can be proof-checked with LPTP.


-  sqrt2\_v0\_main_gaps.pr.   
The initial proof file, with all gaps inside the main theorem.

-  sqrt2\_v1\_lemmas_gaps.pr.   
All gaps in the proofs of the lemmas.

-  sqrt2\_v2\_no\_gap.pr.  
The final proof without any gap.



## Applying ATPs to the proof files

* Install [Vampire](https://vprover.github.io) and [E](https://wwwlehre.dhbw-stuttgart.de/~sschulz/E/E.html) locally
* Install [SWI-Prolog](https://www.swi-prolog.org) locally

The Prolog '.pl' file + the LPTP proof '.pr' file are compiled into FOF syntax by a compiler available as 'indp.pl'. It creates as many files as lemmas appearing  in the proof file and runs Vampire and E on each lemma, with a timeout of 10 seconds for each prover. Please note that *the success rate may vary* depending on the local machine.


- To run the ATPs for sqrt2\_v1\_lemmas_gaps.pr
      
> % swipl -f indp.pl   
> Welcome to SWI-Prolog (threaded, 64 bits, version 10.0.0).  
> ...   
> ?- filename_fofs_run('sqrt2\_lemmas\_gaps\_ATP/sqrt2').   
> ...   

-  To run the ATPs for  sqrt2\_v2\_no\_gap.pr

> ?- filename_fofs_run('sqrt2\_final\_ATP/sqrt2').   
> ...   



