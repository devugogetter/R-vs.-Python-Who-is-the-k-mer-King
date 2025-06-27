# R-vs.-Python-Who-is-the-k-mer-King
Many bioinformaticians toggle between Bioconductor/R and Biopython/Pandas. A data-driven benchmark can help others choose the right tool.

🔬 R vs. Python: Who’s the k-mer king?

I took a <b>16S rRNA FASTA file</b> constituting 18 sequences and ran two scripts:
• R (Biostrings): 33.85 ms
• Python (BioPython + dict): 21.90 ms

Python won by <b>~1.5×—surprising</b>, given Biostrings is C-optimized! The small 4⁴=256 k-mer space and Python’s lightweight timeit gave it the edge.

🔹 R 🐦: built-in genomic tools, concise <br>
🔹 Python 🐍: super-fast for tiny k-mer spaces, merges seamlessly with Pandas/NumPy

Which do you reach for in your pipelines? Drop your thoughts or benchmark tales!

# Directory Structure
benchmark_bio.pynb : Python notebook for benchmarking <br>
benchmark_bio.R : R script for benchmarking <br>
barchart.py : Assisted Bar chart fot Counting Runtimes <br>
sequence.fasta : Test FASTA file used
