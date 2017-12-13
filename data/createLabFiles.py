import os

samplesfile = open("samples.txt", 'r', encoding='utf-8')

for line in samplesfile:

	sample, prompt = line.split(' ',1)

	labfile = open(sample.replace("*/","") + ".lab", "w+", encoding="utf-8")
	labfile.write(prompt.rstrip())
	labfile.close()

