PGDMP  	    5        	        }            tiket    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    tiket    DATABASE     �   CREATE DATABASE tiket WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE tiket;
                     postgres    false            �            1259    16390    admin    TABLE     �   CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255)
);
    DROP TABLE public.admin;
       public         heap r       postgres    false            �            1259    16389    admin_admin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_admin_id_seq;
       public               postgres    false    218            �           0    0    admin_admin_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.admin.admin_id;
          public               postgres    false    217            !           2604    16393    admin admin_id    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_admin_id_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN admin_id DROP DEFAULT;
       public               postgres    false    218    217    218            �          0    16390    admin 
   TABLE DATA           @   COPY public.admin (admin_id, name, email, password) FROM stdin;
    public               postgres    false    218   �
       �           0    0    admin_admin_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.admin_admin_id_seq', 19, true);
          public               postgres    false    217            #           2606    16397    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public                 postgres    false    218            �   �  x�m��n�0E�ï���	ӯ�;�M�6mQ!Z�f$M-Z�,U��������{�Ќ�G_4���L��@���Td2_��v�!���Z�#6��k�pf4�����v��pW������P*s��7S7�{���O�1���ԧ&��-e�@	g����C�H?���2'���`�i���c�r��pA.l��.V���У>V��@=�T(��*�YZu6%����~�7A��j�����U��$��"
��g��>QF�D9B&P�'U�`�����8_Q�M?a�g9�ہ�AY�sV��|����G!���Tv_�+F����R�\�.� �w������k�q8B%�]�1���H��A��o�A�\{�f6������Ә�g�������}��`W���éFW�S0(�z5J�?��     