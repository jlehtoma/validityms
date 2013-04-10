---
tags: tables
---
  
## Table2
### Analysis variants

All the original analysis variants are in the table below. Notice that 
column `Variant` refers to the original variant numbering scheme.

ID | Variant | Cell removal | Condition | Weights | Connectivity | Mask
---|---------|--------------|-----------|---------|--------------|-----
1  |  14     | ABF          |           |         |              |    
2  |  15     | ABF          | x         |         |              |
3  |  16     | ABF          | x         | x       |              |
4  |  17     | ABF          | x         | x       | mtrx         |
5  |  18     | ABF          | x         | x       | mtrx,wkh     |
6  |  19     | ABF          | x         | x       | mtrx,wkh,pa  |
7  |  20     | ABF          | x         | x       | mtrx,wkh,pa  | x

Variants selected for the manuscript are IDs 1, 3, 5 and 7.

----
### Latest version:

OrgID | ID | Variant name	  | Weights | Condition | Internal conn | Interaction conn | Mask
------|----|----------------|---------|-----------|---------------|------------------|-----
1	    | 1	 | Local quality	|         |           |               |		               |
3	    | 2	 | Condition     	| x	      | x	        |               |	                 | 
5	    | 3	 | Connectivity   | x	      | x	        | x	            | x                |
7	    | 4	 | Pas masked		  | x	      | x	        | x	            | x                | x
