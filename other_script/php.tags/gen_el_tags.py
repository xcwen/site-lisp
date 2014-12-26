#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import re
import os 
import bisect 

project_path_len=len( os.path.dirname(os.path.dirname(os.path.abspath(sys.argv[0]))))+1

def get_path_without_project_path(path):
    global project_path_len
    return path[project_path_len:]
    pass

func_regex = re.compile(r'.*\((.*)\).*')
def gen_el_func(func_name,func_doc)  :
    global func_regex 
    m=func_regex.match(func_doc );
    if (m):
        return "%s(<#%s#>)"%(func_name,  m.group(1).replace(",","#>,<#").replace("\s",""));
        pass
    else:
        return  "%s()"%(func_name)

    
class_map={}
class_inherits_map  ={}
def get_class_list( class_name ):
    if class_inherits_map.has_key(class_name):
        cur_class_name=class_inherits_map[class_name];
        return [cur_class_name] +   get_class_list( cur_class_name )
    else:
        return [] 
    
   

def main(argv):

    
    global class_inherits_map ,class_map
    function_data="";


    regex = re.compile(r'^(\w+)\t(.*)\t/\^(.+)\$/;\"\t(\w)\tline:(\d+)(.*)')
    regex_class = re.compile(r'^\tclass:(\w+)\taccess:(.*)')
    regex_inherits = re.compile(r'^\tinherits:(\w+)')
    regex_return = re.compile(r'.*::(\w+).*')

    fp=open("./tags" ,"r");
    for line in fp.xreadlines():
        m=regex.match(line);
        if (m):
            tag_name= m.group(1);
            file_pos= get_path_without_project_path(m.group(2))+":"+m.group(5);
            doc= m.group(3);
            tag_type= m.group(4);
            if (  tag_type=="f" ) :
                function_data+= "['f','%s',\"\"\"%s\"\"\",'%s', 'user' ],\n"%( tag_name, gen_el_func(tag_name,doc),  file_pos  )
            elif (  tag_type=="d" ) :
                function_data+= "['d','%s',\"\"\"%s\"\"\",'%s', 'user' ],\n"%( tag_name, tag_name,  file_pos  )
            elif (  tag_type=="c" ) :
                function_data+= "['c','%s',\"\"\"%s\"\"\",'%s', 'user' ],\n"%( tag_name, tag_name+"()",  file_pos  )
                im=regex_inherits.match(m.group(6)) 
                if im:
                    class_inherits_map[tag_name] = im.group(1)
            elif (  tag_type=="v" ) :
                pass
            elif (  tag_type=="p" or  tag_type=="m"  ) :#class

                return_type=""
                r_m=regex_return.match(doc)
                if r_m:
                    return_type=r_m.group(1)


                cm=regex_class.match( m.group(6) ) 
                if cm:
                    class_name=cm.group(1)
                    accass=cm.group(2)


                    if not class_map.has_key(class_name):
                        class_map[class_name]=[  ];
                    if (tag_type=="p"):
                        doc=tag_name
                    else:
                        doc=gen_el_func(tag_name,doc) 

                    class_map[class_name].append([tag_type,tag_name,doc, file_pos ,return_type ,class_name ])


            else:#class
                print line

        pass
    pass
    

    class_data=""
    for class_name, member_list in class_map.items():
        class_data+= "\t\"%s\":[\n"%class_name;
        for item in member_list :
            class_data+= "\t\t[\"%s\",\"%s\",\"\"\"%s\"\"\",\"%s\",\"user\",\"%s\",\"%s\"],\n"%(item[0],item[1], item[2],  item[3] , item[4], item[5]  )

        class_list=get_class_list(class_name) 
        for p_class in class_list: 
            if (class_map.has_key(p_class )):
                p_member_list=class_map[p_class ]
                for item in p_member_list :
                    class_data+= "\t\t[\"%s\",\"%s\",\"\"\"%s\"\"\",\"%s\",\"user\",\"%s\",\"%s\"],\n"%(item[0],item[1], item[2],  item[3] , item[4], item[5]  )

                
        class_data+= "\t],\n"
        pass


    class_inherits_data=""
    for class_name, parent_name in class_inherits_map.items():
        class_inherits_data+= "\t\"%s\":\t\"%s\",\n"%(class_name,parent_name )
        pass

    
    open("./function_data.py", "w").write("""#!/usr/bin/env python
# -*- coding: utf-8 -*-
function_data=[
%s
]
   """%(function_data))
    #class
    open("./class_data.py", "w").write("""#!/usr/bin/env python
# -*- coding: utf-8 -*-
class_data={
%s
}
class_inherits_data={
%s
}
    """%(class_data,class_inherits_data ))


    

if __name__ == "__main__":
	main(sys.argv)
