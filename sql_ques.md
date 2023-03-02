### Question A
How many types of tigers can be found in the taxonomy table of the dataset? What is the "ncbi_id" of the Sumatran Tiger? 

**Ans:** There are total 8 types of tigers in the taxonomy table and 'ncbi_id' of the Sumatran Tiger is '9695'

**Query:**
 
 ```
SELECT COUNT(*)
FROM taxonomy t
WHERE t.species LIKE '%Panthera tigris%' # 'Panthera tigris' is the biological name of tiger
```
```
SELECT t.ncbi_id
FROM taxonomy t
WHERE t.species LIKE '%Sumatran tiger%'
```
### Question B
Find all the columns that can be used to connect the tables in the given database.

**Ans:** We can use `rfam_acc`, `rfamseq_acc`, `ncbi_id`, `clan_acc ` columns to join `family`, `rfamseq`, `full_region`, `clan`, `clan_membership`, `taxonomy`, `family_ncbi` and many other unexploerd tables.

### Question C
Which type of rice has the longest DNA sequence?

**Ans:** `Oryza sativa Indica Group` has the longest DNA sequence `47244934`

**Query:**
```
SELECT max(r.length) as length, t.species
FROM rfamseq r 
JOIN taxonomy t ON  t.ncbi_id = r.ncbi_id 
WHERE t.species LIKE "%Oryza sativa%"
```
### Question D
We want to paginate a list of the family names and their longest DNA sequence lengths (in descending order of length) where only families that have DNA sequence lengths greater than 1,000,000 are included. Give a query that will return the 9th page when there are 15 results per page.

**Query:**
```
SELECT rfam_acc, rfam_id as fam_name, max(length) as max_length
FROM (
  SELECT ncbi_id, length
  FROM rfamseq
  WHERE length > 1000000
) AS subq
JOIN family_ncbi fn ON subq.ncbi_id = fn.ncbi_id
group by rfam_acc, fam_name
ORDER BY max_length DESC
LIMIT 15 OFFSET 120
```
