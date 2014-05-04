#!/usr/bin/env python

import os
import re
from git import Repo

BUILD_DIR = "pandoc/build/"

INPUT_FM_FILE = "validity_ms_front_matter.md"
TARGET_FM_FILE = os.path.join(BUILD_DIR, "validity_ms_front_matter_prep.md")
INPUT_MAIN_FILE = "validity_ms.md"
TARGET_MAIN_FILE = os.path.join(BUILD_DIR, "validity_ms_prep.md")

GH_ISSUE_URL = "https://github.com/jlehtoma/validityms/issues/"

repo = Repo(".")
current_tag = repo.tags[-1].name

def preprocess_fm_file(input_file, target_file):

    with open(target_file, 'w') as outfile, open(input_file, 'r') as infile:
        for line in infile:
            if "Version" in line:
                line = "{0} {1}\n".format(line, current_tag)
            
            outfile.write(line)

def preprocess_main_file(input_file, target_file):
    with open(target_file, 'w') as outfile, open(input_file, 'r') as infile:
        for line in infile:
            issues = re.findall(r'\[(#[^]]*)\]', line)
            for issue in issues:
                issue_url = GH_ISSUE_URL + issue.replace("#", "")
                link = "([{0}]({1}))".format(issue, issue_url)
                line = line.replace("[" + issue + "]", link)

            outfile.write(line)


preprocess_fm_file(INPUT_FM_FILE, TARGET_FM_FILE)
preprocess_main_file(INPUT_MAIN_FILE, TARGET_MAIN_FILE) 
