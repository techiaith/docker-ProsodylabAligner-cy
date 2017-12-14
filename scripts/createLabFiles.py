#!/usr/bin/python3
import os
import shutil

samplesfile = open(os.path.join("paldaruo", "samples.txt"), 'r', encoding='utf-8')
metadatafile = open(os.path.join("paldaruo", "metadata.csv"), 'r', encoding='utf-8')

sampleslookup={}

for line in samplesfile:

        sample, prompt = line.split(' ',1)
        sampleslookup[sample.replace("*/","")]=prompt

for contribution in metadatafile:

        uid = contribution.split(',',1)[0]
        if uid=="uid":
                continue

        wavdir = os.path.join("paldaruo", "wav", uid)
        print (wavdir)

        for root, dirs, files in os.walk(wavdir):
                for file in files:

                        if not file.startswith("sample"):
                                continue
                        if not file.endswith(".wav"):
                                continue

                        sampleid=file.replace(".wav","")
                        prompt=sampleslookup[sampleid]

                        print (sampleid, prompt)

                        newwavfilename = uid + "_" + sampleid + ".wav"
                        labfilename = uid + "_" + sampleid + ".lab"

                        shutil.move(os.path.join(wavdir, file), os.path.join('paldaruo', newwavfilename))

                        labfile = open(os.path.join('paldaruo', labfilename), "w+", encoding="utf-8")
                        labfile.write(prompt.rstrip())
                        labfile.close()

shutil.rmtree(os.path.join('paldaruo','wav'))

