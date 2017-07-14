def transcribeDNA(s):
    DNA = s.upper()
    return "Transcribed RNA comes out here --> %s" % DNA.replace("T", "U")

DNA = raw_input("DNA goes here --> ")


print transcribeDNA(DNA)
