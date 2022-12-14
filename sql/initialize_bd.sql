PGDMP                         z            sistema-produccion-agricola    13.7 (Debian 13.7-0+deb11u1)    13.7 (Debian 13.7-0+deb11u1) A               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16384    sistema-produccion-agricola    DATABASE     r   CREATE DATABASE "sistema-produccion-agricola" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_CR.UTF-8';
 -   DROP DATABASE "sistema-produccion-agricola";
                postgres    false            ?            1259    16409    Area    TABLE     ?   CREATE TABLE public."Area" (
    id integer NOT NULL,
    code character(4),
    dimension numeric,
    "principalProduct" character varying
);
    DROP TABLE public."Area";
       public         heap    postgres    false            ?            1259    16407    Area_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Area_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Area_id_seq";
       public          postgres    false    205            	           0    0    Area_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Area_id_seq" OWNED BY public."Area".id;
          public          postgres    false    204            ?            1259    16452    Bill    TABLE     ?   CREATE TABLE public."Bill" (
    id integer NOT NULL,
    day smallint,
    month smallint,
    year smallint,
    client_name character varying,
    shop_name character varying,
    legal_identity character varying,
    phone_number text
);
    DROP TABLE public."Bill";
       public         heap    postgres    false            ?            1259    16471    BillXProduct    TABLE     ?   CREATE TABLE public."BillXProduct" (
    id integer NOT NULL,
    fk_id_bill integer,
    fk_id_product integer,
    fk_id_area integer
);
 "   DROP TABLE public."BillXProduct";
       public         heap    postgres    false            ?            1259    16469    BillXProduct_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."BillXProduct_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."BillXProduct_id_seq";
       public          postgres    false    213            
           0    0    BillXProduct_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."BillXProduct_id_seq" OWNED BY public."BillXProduct".id;
          public          postgres    false    212            ?            1259    16450    Bill_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Bill_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Bill_id_seq";
       public          postgres    false    211                       0    0    Bill_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Bill_id_seq" OWNED BY public."Bill".id;
          public          postgres    false    210            ?            1259    16387    Employee    TABLE     ?   CREATE TABLE public."Employee" (
    id integer NOT NULL,
    "idNumber" character varying(10),
    name character varying,
    "position" character varying,
    salary money
);
    DROP TABLE public."Employee";
       public         heap    postgres    false            ?            1259    16385    Employee_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Employee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Employee_id_seq";
       public          postgres    false    201                       0    0    Employee_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Employee_id_seq" OWNED BY public."Employee".id;
          public          postgres    false    200            ?            1259    16420    Payroll    TABLE     b   CREATE TABLE public."Payroll" (
    id integer NOT NULL,
    month smallint,
    year smallint
);
    DROP TABLE public."Payroll";
       public         heap    postgres    false            ?            1259    16434    PayrollXEmployee    TABLE     ~   CREATE TABLE public."PayrollXEmployee" (
    id integer NOT NULL,
    id_employee integer NOT NULL,
    id_payroll integer
);
 &   DROP TABLE public."PayrollXEmployee";
       public         heap    postgres    false            ?            1259    16432    PayrollXEmployee_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."PayrollXEmployee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."PayrollXEmployee_id_seq";
       public          postgres    false    209                       0    0    PayrollXEmployee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."PayrollXEmployee_id_seq" OWNED BY public."PayrollXEmployee".id;
          public          postgres    false    208            ?            1259    16418    Payroll_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Payroll_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Payroll_id_seq";
       public          postgres    false    207                       0    0    Payroll_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Payroll_id_seq" OWNED BY public."Payroll".id;
          public          postgres    false    206            ?            1259    16398    Product    TABLE     ?   CREATE TABLE public."Product" (
    id integer NOT NULL,
    batch character(4),
    name character varying,
    cost money,
    taxe money
);
    DROP TABLE public."Product";
       public         heap    postgres    false            ?            1259    16396    Product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Product_id_seq";
       public          postgres    false    203                       0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
          public          postgres    false    202            ?            1259    16748    Prueba    TABLE     M   CREATE TABLE public."Prueba" (
    id bigint NOT NULL,
    dinero numeric
);
    DROP TABLE public."Prueba";
       public         heap    postgres    false            ?            1259    16746    Prueba_id_seq    SEQUENCE     x   CREATE SEQUENCE public."Prueba_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Prueba_id_seq";
       public          postgres    false    215                       0    0    Prueba_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Prueba_id_seq" OWNED BY public."Prueba".id;
          public          postgres    false    214            V           2604    16412    Area id    DEFAULT     f   ALTER TABLE ONLY public."Area" ALTER COLUMN id SET DEFAULT nextval('public."Area_id_seq"'::regclass);
 8   ALTER TABLE public."Area" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            Y           2604    16455    Bill id    DEFAULT     f   ALTER TABLE ONLY public."Bill" ALTER COLUMN id SET DEFAULT nextval('public."Bill_id_seq"'::regclass);
 8   ALTER TABLE public."Bill" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            Z           2604    16474    BillXProduct id    DEFAULT     v   ALTER TABLE ONLY public."BillXProduct" ALTER COLUMN id SET DEFAULT nextval('public."BillXProduct_id_seq"'::regclass);
 @   ALTER TABLE public."BillXProduct" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            T           2604    16390    Employee id    DEFAULT     n   ALTER TABLE ONLY public."Employee" ALTER COLUMN id SET DEFAULT nextval('public."Employee_id_seq"'::regclass);
 <   ALTER TABLE public."Employee" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            W           2604    16423 
   Payroll id    DEFAULT     l   ALTER TABLE ONLY public."Payroll" ALTER COLUMN id SET DEFAULT nextval('public."Payroll_id_seq"'::regclass);
 ;   ALTER TABLE public."Payroll" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            X           2604    16437    PayrollXEmployee id    DEFAULT     ~   ALTER TABLE ONLY public."PayrollXEmployee" ALTER COLUMN id SET DEFAULT nextval('public."PayrollXEmployee_id_seq"'::regclass);
 D   ALTER TABLE public."PayrollXEmployee" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            U           2604    16401 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            [           2604    16751 	   Prueba id    DEFAULT     j   ALTER TABLE ONLY public."Prueba" ALTER COLUMN id SET DEFAULT nextval('public."Prueba_id_seq"'::regclass);
 :   ALTER TABLE public."Prueba" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            ?          0    16409    Area 
   TABLE DATA           I   COPY public."Area" (id, code, dimension, "principalProduct") FROM stdin;
    public          postgres    false    205   ?F       ?          0    16452    Bill 
   TABLE DATA           l   COPY public."Bill" (id, day, month, year, client_name, shop_name, legal_identity, phone_number) FROM stdin;
    public          postgres    false    211   tG                  0    16471    BillXProduct 
   TABLE DATA           S   COPY public."BillXProduct" (id, fk_id_bill, fk_id_product, fk_id_area) FROM stdin;
    public          postgres    false    213   `H       ?          0    16387    Employee 
   TABLE DATA           N   COPY public."Employee" (id, "idNumber", name, "position", salary) FROM stdin;
    public          postgres    false    201   ?H       ?          0    16420    Payroll 
   TABLE DATA           4   COPY public."Payroll" (id, month, year) FROM stdin;
    public          postgres    false    207   ?I       ?          0    16434    PayrollXEmployee 
   TABLE DATA           I   COPY public."PayrollXEmployee" (id, id_employee, id_payroll) FROM stdin;
    public          postgres    false    209   0J       ?          0    16398    Product 
   TABLE DATA           @   COPY public."Product" (id, batch, name, cost, taxe) FROM stdin;
    public          postgres    false    203   ?J                 0    16748    Prueba 
   TABLE DATA           .   COPY public."Prueba" (id, dinero) FROM stdin;
    public          postgres    false    215   6K                  0    0    Area_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Area_id_seq"', 20, true);
          public          postgres    false    204                       0    0    BillXProduct_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."BillXProduct_id_seq"', 17, true);
          public          postgres    false    212                       0    0    Bill_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Bill_id_seq"', 23, true);
          public          postgres    false    210                       0    0    Employee_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Employee_id_seq"', 216, true);
          public          postgres    false    200                       0    0    PayrollXEmployee_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."PayrollXEmployee_id_seq"', 52, true);
          public          postgres    false    208                       0    0    Payroll_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Payroll_id_seq"', 20, true);
          public          postgres    false    206                       0    0    Product_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Product_id_seq"', 172, true);
          public          postgres    false    202                       0    0    Prueba_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Prueba_id_seq"', 1, true);
          public          postgres    false    214            a           2606    16417    Area Area_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Area"
    ADD CONSTRAINT "Area_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Area" DROP CONSTRAINT "Area_pkey";
       public            postgres    false    205            i           2606    16476    BillXProduct BillXProduct_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT "BillXProduct_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."BillXProduct" DROP CONSTRAINT "BillXProduct_pkey";
       public            postgres    false    213            g           2606    16460    Bill Bill_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Bill"
    ADD CONSTRAINT "Bill_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Bill" DROP CONSTRAINT "Bill_pkey";
       public            postgres    false    211            ]           2606    16395    Employee Employee_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "Employee_pkey";
       public            postgres    false    201            e           2606    16745 &   PayrollXEmployee PayrollXEmployee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT "PayrollXEmployee_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."PayrollXEmployee" DROP CONSTRAINT "PayrollXEmployee_pkey";
       public            postgres    false    209            c           2606    16425    Payroll Payroll_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Payroll"
    ADD CONSTRAINT "Payroll_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Payroll" DROP CONSTRAINT "Payroll_pkey";
       public            postgres    false    207            _           2606    16406    Product Product_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            postgres    false    203            k           2606    16753    Prueba Prueba_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Prueba"
    ADD CONSTRAINT "Prueba_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Prueba" DROP CONSTRAINT "Prueba_pkey";
       public            postgres    false    215            p           2606    16487    BillXProduct fk_area    FK CONSTRAINT     y   ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_area FOREIGN KEY (fk_id_area) REFERENCES public."Area"(id);
 @   ALTER TABLE ONLY public."BillXProduct" DROP CONSTRAINT fk_area;
       public          postgres    false    213    205    2913            n           2606    16477    BillXProduct fk_bill    FK CONSTRAINT     y   ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_bill FOREIGN KEY (fk_id_bill) REFERENCES public."Bill"(id);
 @   ALTER TABLE ONLY public."BillXProduct" DROP CONSTRAINT fk_bill;
       public          postgres    false    213    211    2919            l           2606    16440    PayrollXEmployee fk_id_employee    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT fk_id_employee FOREIGN KEY (id_employee) REFERENCES public."Employee"(id);
 K   ALTER TABLE ONLY public."PayrollXEmployee" DROP CONSTRAINT fk_id_employee;
       public          postgres    false    201    2909    209            m           2606    16445    PayrollXEmployee fk_id_payroll    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT fk_id_payroll FOREIGN KEY (id_payroll) REFERENCES public."Payroll"(id);
 J   ALTER TABLE ONLY public."PayrollXEmployee" DROP CONSTRAINT fk_id_payroll;
       public          postgres    false    209    2915    207            o           2606    16482    BillXProduct fk_product    FK CONSTRAINT     ?   ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_product FOREIGN KEY (fk_id_product) REFERENCES public."Product"(id);
 C   ALTER TABLE ONLY public."BillXProduct" DROP CONSTRAINT fk_product;
       public          postgres    false    213    2911    203            ?   ?   x?-?1?0???݇?\?&?(????rj?JH??`?????vީB	?s8?˾&??	?i?r-?B??D?c8[y?L-ZB?4L??3[D$?c<>?hB"\l.?????m6ZY????	???{Y?*?a???ᓭ??*׃??  ,:      ?   ?   x??R??0<o??_`?[?W?h?ु??&??į??ݽ?afvvZD?MB?9??J??/??P*~uz?
?d'i??udH Ǟ???~??Yk??W"J?????5p?O?:b?ud???????JW??>:?X?|tX?f8Ia??`6?4&?????t??m??׺??D")?h<>^???~??*e:??O^}y?B???????p????{c5?s          9   x?%??? ??]L?t'zI?u$??h??-?f^??Yʸe?R??s?V?A????v?
W      ?   2  x?u?KN?0E?/????|?!?*??@U$??k??R?r!v?
?SW?KtbK???ս!OA??(N?y?a?+#k??b?n?U?!?-??󋉄??9?W?!???
?{T?	Mm?;?i?[xؓA#?@?ܣ3??"?UF?? =X.w??`ߵ?G-88vw}i?+2,?M?EL??"X???iORl?35TY?{???r?Ҩ΋?8(?[?l?t?=????}????J?0???jMM?ЍT???SMKU???F?Ϝ?c??h?._m??>/???\??mG?rA?rM/po?>p?~???Nw??      ?   5   x?34???4202?24㴄??9?,.C??e	Qg?ed?ihQ???? L?	?      ?   S   x?%???0?7?
٥??QS~'?-??h??jq)??qM???L??1K?3Eu3E^???;?Eؿk???Tq      ?   ?   x?343?4pTP?H,H?|ԴP???@?? ?44???L8??J?Ks?J???r?eFe???P?*1?2??1?4????????Qf?d%?,sN#??a??y??U??? T??C?Z??%Q07 ?sC?<`nD?b???? ^:n?            x?3?4?35?????? -?     