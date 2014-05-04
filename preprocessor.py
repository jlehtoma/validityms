#!/usr/bin/env python

import re

INPUT_FILE = "validity_ms.md"
TARGET_FILE = "pandoc/build/validity_ms_preprocessed.md"

GH_ISSUE_URL = "https://github.com/jlehtoma/validityms/issues/"


def preprocess_md(input_file, target_file):
    with open(target_file, 'w') as outfile, open(input_file, 'r') as infile:
        for line in infile:
            issues = re.findall(r'\[(#[^]]*)\]', line)
            for issue in issues:
                issue_url = GH_ISSUE_URL + issue.replace("#", "")
                link = "([{0}]({1}))".format(issue, issue_url)
                line = line.replace("[" + issue + "]", link)

            outfile.write(line)

# input the name you want to check against    
preprocess_md(INPUT_FILE, TARGET_FILE) 
