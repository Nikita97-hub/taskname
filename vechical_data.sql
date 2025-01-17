PGDMP  8    )                |            vehical_data    16.3    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16642    vehical_data    DATABASE        CREATE DATABASE vehical_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE vehical_data;
                postgres    false            Z           1247    16674 	   user_role    TYPE     S   CREATE TYPE public.user_role AS ENUM (
    'admin',
    'user',
    'developer'
);
    DROP TYPE public.user_role;
       public          postgres    false            S           1247    16662 	   user_type    DOMAIN     �   CREATE DOMAIN public.user_type AS character varying(10)
	CONSTRAINT user_type_check CHECK (((VALUE)::text = ANY ((ARRAY['admin'::character varying, 'buyer'::character varying, 'seller'::character varying])::text[])));
    DROP DOMAIN public.user_type;
       public          postgres    false            �            1259    16653    sales    TABLE     �   CREATE TABLE public.sales (
    id integer NOT NULL,
    customer_id bigint NOT NULL,
    vehical_id bigint NOT NULL,
    loan_status boolean DEFAULT false NOT NULL
);
    DROP TABLE public.sales;
       public         heap    postgres    false                       0    0    TABLE sales    ACL     /   GRANT SELECT ON TABLE public.sales TO da8user;
          public          postgres    false    218            �            1259    16652    sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public          postgres    false    218            	           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
          public          postgres    false    217            �            1259    16665    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(150),
    mob_no integer,
    user_category public.user_type NOT NULL,
    user_role_type public.user_role
);
    DROP TABLE public.users;
       public         heap    postgres    false    858    851            �            1259    16664    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    220            
           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    219            �            1259    16644    vechical    TABLE     �   CREATE TABLE public.vechical (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    price double precision DEFAULT 0 NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    model character varying(150) NOT NULL
);
    DROP TABLE public.vechical;
       public         heap    postgres    false                       0    0    TABLE vechical    ACL     9   GRANT SELECT,INSERT ON TABLE public.vechical TO da8user;
          public          postgres    false    216            �            1259    16643    vechical_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vechical_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.vechical_id_seq;
       public          postgres    false    216                       0    0    vechical_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.vechical_id_seq OWNED BY public.vechical.id;
          public          postgres    false    215            d           2604    16656    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            f           2604    16668    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            a           2604    16647    vechical id    DEFAULT     j   ALTER TABLE ONLY public.vechical ALTER COLUMN id SET DEFAULT nextval('public.vechical_id_seq'::regclass);
 :   ALTER TABLE public.vechical ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16653    sales 
   TABLE DATA           I   COPY public.sales (id, customer_id, vehical_id, loan_status) FROM stdin;
    public          postgres    false    218   �                 0    16665    users 
   TABLE DATA           P   COPY public.users (id, name, mob_no, user_category, user_role_type) FROM stdin;
    public          postgres    false    220   ,       �          0    16644    vechical 
   TABLE DATA           F   COPY public.vechical (id, name, price, is_deleted, model) FROM stdin;
    public          postgres    false    216   v                  0    0    sales_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.sales_id_seq', 20, true);
          public          postgres    false    217                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    219                       0    0    vechical_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.vechical_id_seq', 20, true);
          public          postgres    false    215            j           2606    16659    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public            postgres    false    218            l           2606    16672    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            h           2606    16651    vechical vechical_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.vechical
    ADD CONSTRAINT vechical_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.vechical DROP CONSTRAINT vechical_pkey;
       public            postgres    false    216            �   �   x�-��1Ckz���K����#�Kc<$%�Z ��R��C�l(���C9��?&�s��Ml�m`�
��I7�l,��k�� w0��}���j�>��ANw�̜ϼװ�*���|������V�k���~�Z��)�         :   x�3�,-N-2�442"Τ���"�?.ST��Ԝ��!.	#T�Ĕ��<�W� �h�      �   �   x�M�=jD1�Zs���cשs�m٭�ܿ��
��Ǔ�y����1(��S^������̒)�Mo�X%K���-Z�2������q������;ZQ�c�h	�-�Fm�8%G��X��?e�Q�q�,�8�=����6{	N�zȈ����*"#V�ؤ`5��ޝVa��]V�v���8�sش�j#���q}v0���h��7 =�{%     