
i = 0
while i < 4
    outFileName = "outstr" + i.to_s + ".txt"
    File.open(outFileName,'w'){|f|
	f.write "aa"
    }
    i += 1
end

