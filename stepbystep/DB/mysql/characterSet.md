#字符集


 mysql同一台服务器，同一个数据库，同一个表的不同字段都可以指定使用不同字符集

字符集(CHARACTER)VS校对规则(COLLATION)
--------
1. 字符集 定义mysql存储字符串方式
2. 校对规则 定义比较字符串的方式


    查看字符集：  show character set;
    查看校对规则： SHOW COLLATION LIKE 'utf8%';
    
字符集的选择
---------
满足应用前提下，尽量使用小的字符集。（节省空间/减少网络传输字节数）

字符集设置
---------
4个级别设置：服务器级，数据库级，表级，字段级

    服务器默认字符集latin1,没指定校对规则，使用该字符集默认校对规则
    
    服务器级设置：
    1. my.cnf中设置
        default-character-set=utf8
    2. 启动选项中指定
        mysqld --default-character-set=utf8
    3. 编译时指定
        ./configure --with-charset=utf8
    
    查询当前服务器字符集和校对规则：
    show variables like 'character_set_server'