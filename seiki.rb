df = open("url.txt","r")
re = /.+2012_(\d{5})/
while line = df.gets
    if line =~ re
	p $1
    end
end

