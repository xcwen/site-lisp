wget -O - "http://hq.sinajs.cn/etag.php?rn=1383530775836&list=gb_taom,gb_qihu,gb_bidu,gb_sina,gb_dang,gb_yoku,gb_sohu,gb_renn,gb_ntes,gb_ctrp,gb_ga" 2>/dev/null |     iconv -f gb2312 -t utf8 | sed -e "s/.*=\"//" | awk -F, '{print $1, $2 ,$3}' |  column -t
 
