import sys
import re

def convert(infile, outfile):
    with open(infile, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    with open(outfile, 'w', encoding='utf-8') as f:
        in_copy = False
        table_name = ''
        columns = ''
        
        for line in lines:
            if line.startswith('COPY '):
                m = re.match(r'COPY\s+([^\s]+)\s*\((.*?)\)\s+FROM\s+stdin;', line)
                if m:
                    in_copy = True
                    table_name = m.group(1)
                    columns = m.group(2)
                    continue
            if in_copy:
                if line.strip() == '\.':
                    in_copy = False
                    continue
                parts = line.rstrip('\n').split('\t')
                values = []
                for p in parts:
                    if p == r'\N':
                        values.append('NULL')
                    else:
                        p = p.replace("'", "''")
                        values.append(f"'{p}'")
                f.write(f"INSERT INTO {table_name} ({columns}) VALUES ({', '.join(values)});\n")
            else:
                f.write(line)

convert('d:/eternal-lagoon-2/database_schema.sql', 'd:/eternal-lagoon-2/database_schema_inserts.sql')
