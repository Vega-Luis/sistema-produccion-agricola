PGDMP     #    (    
            z            sistema-produccion-agricola    13.7 (Debian 13.7-0+deb11u1)    13.7 (Debian 13.7-0+deb11u1) :    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    sistema-produccion-agricola    DATABASE     r   CREATE DATABASE "sistema-produccion-agricola" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_CR.UTF-8';
 -   DROP DATABASE "sistema-produccion-agricola";
                postgres    false            �            1259    16409    Area    TABLE     �   CREATE TABLE public."Area" (
    id integer NOT NULL,
    code character(4),
    dimension real,
    "principalProduct" character varying
);
    DROP TABLE public."Area";
       public         heap    postgres    false            �            1259    16407    Area_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Area_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Area_id_seq";
       public          postgres    false    205            �           0    0    Area_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Area_id_seq" OWNED BY public."Area".id;
          public          postgres    false    204            �            1259    16452    Bill    TABLE     �   CREATE TABLE public."Bill" (
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
       public         heap    postgres    false            �            1259    16471    BillXProduct    TABLE     �   CREATE TABLE public."BillXProduct" (
    id integer NOT NULL,
    fk_id_bill integer,
    fk_id_product integer,
    fk_id_area integer
);
 "   DROP TABLE public."BillXProduct";
       public         heap    postgres    false            �            1259    16469    BillXProduct_id_seq    SEQUENCE     �   CREATE SEQUENCE public."BillXProduct_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."BillXProduct_id_seq";
       public          postgres    false    213            �           0    0    BillXProduct_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."BillXProduct_id_seq" OWNED BY public."BillXProduct".id;
          public          postgres    false    212            �            1259    16450    Bill_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Bill_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Bill_id_seq";
       public          postgres    false    211            �           0    0    Bill_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Bill_id_seq" OWNED BY public."Bill".id;
          public          postgres    false    210            �            1259    16387    Employee    TABLE     �   CREATE TABLE public."Employee" (
    id integer NOT NULL,
    "idNumber" character varying(10),
    name character varying,
    "position" character varying,
    salary real
);
    DROP TABLE public."Employee";
       public         heap    postgres    false            �            1259    16385    Employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Employee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Employee_id_seq";
       public          postgres    false    201                        0    0    Employee_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Employee_id_seq" OWNED BY public."Employee".id;
          public          postgres    false    200            �            1259    16420    Payroll    TABLE     b   CREATE TABLE public."Payroll" (
    id integer NOT NULL,
    month smallint,
    year smallint
);
    DROP TABLE public."Payroll";
       public         heap    postgres    false            �            1259    16434    PayrollXEmployee    TABLE     ~   CREATE TABLE public."PayrollXEmployee" (
    id integer NOT NULL,
    id_employee integer NOT NULL,
    id_payroll integer
);
 &   DROP TABLE public."PayrollXEmployee";
       public         heap    postgres    false            �            1259    16432    PayrollXEmployee_id_seq    SEQUENCE     �   CREATE SEQUENCE public."PayrollXEmployee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."PayrollXEmployee_id_seq";
       public          postgres    false    209                       0    0    PayrollXEmployee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."PayrollXEmployee_id_seq" OWNED BY public."PayrollXEmployee".id;
          public          postgres    false    208            �            1259    16418    Payroll_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Payroll_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Payroll_id_seq";
       public          postgres    false    207                       0    0    Payroll_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Payroll_id_seq" OWNED BY public."Payroll".id;
          public          postgres    false    206            �            1259    16398    Product    TABLE     �   CREATE TABLE public."Product" (
    id integer NOT NULL,
    batch character(4),
    name character varying,
    cost real,
    taxe real
);
    DROP TABLE public."Product";
       public         heap    postgres    false            �            1259    16396    Product_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Product_id_seq";
       public          postgres    false    203                       0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
          public          postgres    false    202            O           2604    16412    Area id    DEFAULT     f   ALTER TABLE ONLY public."Area" ALTER COLUMN id SET DEFAULT nextval('public."Area_id_seq"'::regclass);
 8   ALTER TABLE public."Area" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            R           2604    16455    Bill id    DEFAULT     f   ALTER TABLE ONLY public."Bill" ALTER COLUMN id SET DEFAULT nextval('public."Bill_id_seq"'::regclass);
 8   ALTER TABLE public."Bill" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            S           2604    16474    BillXProduct id    DEFAULT     v   ALTER TABLE ONLY public."BillXProduct" ALTER COLUMN id SET DEFAULT nextval('public."BillXProduct_id_seq"'::regclass);
 @   ALTER TABLE public."BillXProduct" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            M           2604    16390    Employee id    DEFAULT     n   ALTER TABLE ONLY public."Employee" ALTER COLUMN id SET DEFAULT nextval('public."Employee_id_seq"'::regclass);
 <   ALTER TABLE public."Employee" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            P           2604    16423 
   Payroll id    DEFAULT     l   ALTER TABLE ONLY public."Payroll" ALTER COLUMN id SET DEFAULT nextval('public."Payroll_id_seq"'::regclass);
 ;   ALTER TABLE public."Payroll" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            Q           2604    16437    PayrollXEmployee id    DEFAULT     ~   ALTER TABLE ONLY public."PayrollXEmployee" ALTER COLUMN id SET DEFAULT nextval('public."PayrollXEmployee_id_seq"'::regclass);
 D   ALTER TABLE public."PayrollXEmployee" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            N           2604    16401 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �          0    16409    Area 
   TABLE DATA           I   COPY public."Area" (id, code, dimension, "principalProduct") FROM stdin;
    public          postgres    false    205   �?       �          0    16452    Bill 
   TABLE DATA           l   COPY public."Bill" (id, day, month, year, client_name, shop_name, legal_identity, phone_number) FROM stdin;
    public          postgres    false    211   @       �          0    16471    BillXProduct 
   TABLE DATA           S   COPY public."BillXProduct" (id, fk_id_bill, fk_id_product, fk_id_area) FROM stdin;
    public          postgres    false    213   )@       �          0    16387    Employee 
   TABLE DATA           N   COPY public."Employee" (id, "idNumber", name, "position", salary) FROM stdin;
    public          postgres    false    201   F@       �          0    16420    Payroll 
   TABLE DATA           4   COPY public."Payroll" (id, month, year) FROM stdin;
    public          postgres    false    207   c@       �          0    16434    PayrollXEmployee 
   TABLE DATA           I   COPY public."PayrollXEmployee" (id, id_employee, id_payroll) FROM stdin;
    public          postgres    false    209   �@       �          0    16398    Product 
   TABLE DATA           @   COPY public."Product" (id, batch, name, cost, taxe) FROM stdin;
    public          postgres    false    203   �@                  0    0    Area_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Area_id_seq"', 1, true);
          public          postgres    false    204                       0    0    BillXProduct_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."BillXProduct_id_seq"', 1, false);
          public          postgres    false    212                       0    0    Bill_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Bill_id_seq"', 1, false);
          public          postgres    false    210                       0    0    Employee_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Employee_id_seq"', 1, false);
          public          postgres    false    200                       0    0    PayrollXEmployee_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."PayrollXEmployee_id_seq"', 1, false);
          public          postgres    false    208            	           0    0    Payroll_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Payroll_id_seq"', 1, false);
          public          postgres    false    206            
           0    0    Product_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Product_id_seq"', 1, false);
          public          postgres    false    202            Y           2606    16417    Area Area_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Area"
    ADD CONSTRAINT "Area_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Area" DROP CONSTRAINT "Area_pkey";
       public            postgres    false    205            a           2606    16476    BillXProduct BillXProduct_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT "BillXProduct_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."BillXProduct" DROP CONSTRAINT "BillXProduct_pkey";
       public            postgres    false    213            _           2606    16460    Bill Bill_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Bill"
    ADD CONSTRAINT "Bill_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Bill" DROP CONSTRAINT "Bill_pkey";
       public            postgres    false    211            U           2606    16395    Employee Employee_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "Employee_pkey";
       public            postgres    false    201            ]           2606    16439 &   PayrollXEmployee PayrollXEmployee_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT "PayrollXEmployee_pkey" PRIMARY KEY (id_employee);
 T   ALTER TABLE ONLY public."PayrollXEmployee" DROP CONSTRAINT "PayrollXEmployee_pkey";
       public            postgres    false    209            [           2606    16425    Payroll Payroll_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Payroll"
    ADD CONSTRAINT "Payroll_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Payroll" DROP CONSTRAINT "Payroll_pkey";
       public            postgres    false    207            W           2606    16406    Product Product_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            postgres    false    203            f           2606    16487    BillXProduct fk_area    FK CONSTRAINT     y   ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_area FOREIGN KEY (fk_id_area) REFERENCES public."Area"(id);
 @   ALTER TABLE ONLY public."BillXProduct" DROP CONSTRAINT fk_area;
       public          postgres    false    213    205    2905            d           2606    16477    BillXProduct fk_bill    FK CONSTRAINT     y   ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_bill FOREIGN KEY (fk_id_bill) REFERENCES public."Bill"(id);
 @   ALTER TABLE ONLY public."BillXProduct" DROP CONSTRAINT fk_bill;
       public          postgres    false    213    2911    211            b           2606    16440    PayrollXEmployee fk_id_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT fk_id_employee FOREIGN KEY (id_employee) REFERENCES public."Employee"(id);
 K   ALTER TABLE ONLY public."PayrollXEmployee" DROP CONSTRAINT fk_id_employee;
       public          postgres    false    2901    201    209            c           2606    16445    PayrollXEmployee fk_id_payroll    FK CONSTRAINT     �   ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT fk_id_payroll FOREIGN KEY (id_payroll) REFERENCES public."Payroll"(id);
 J   ALTER TABLE ONLY public."PayrollXEmployee" DROP CONSTRAINT fk_id_payroll;
       public          postgres    false    209    2907    207            e           2606    16482    BillXProduct fk_product    FK CONSTRAINT     �   ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_product FOREIGN KEY (fk_id_product) REFERENCES public."Product"(id);
 C   ALTER TABLE ONLY public."BillXProduct" DROP CONSTRAINT fk_product;
       public          postgres    false    2903    213    203            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     