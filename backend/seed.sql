--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    comment_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    post_id uuid NOT NULL,
    text text NOT NULL,
    author text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    author text NOT NULL,
    body text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: posttags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posttags (
    post_id uuid NOT NULL,
    tag_id uuid NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    username text NOT NULL,
    password text NOT NULL,
    avatar_url text NOT NULL,
    member_since timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    bio text NOT NULL
);


--
-- Name: votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.votes (
    post_id uuid NOT NULL,
    username text NOT NULL,
    value integer NOT NULL
);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.comments (comment_id, post_id, text, author, created_at) FROM stdin;
54c60ba1-3224-40b5-8b3f-adb8eaa9397d	be5569f2-e2bf-4e8d-82ea-224c2a3fb045	First Comment Ever!!!	fish_guy	2020-09-16 11:25:50.878246
9e12e70f-7cf6-4b59-8aae-4388a80aa6af	be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada nisl sem, id pretium quam pretium vel. Nam imperdiet magna eu viverra pulvinar. Morbi fermentum dui sem, a tincidunt diam placerat nec. Sed eget rutrum augue, in ultricies quam. Sed et ipsum eget sapien ultrices condimentum. Maecenas mollis egestas pellentesque. Suspendisse nec pellentesque dolor, id finibus nunc. Nulla in ex a velit tristique semper. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\n\nSed volutpat arcu a accumsan bibendum. Ut id luctus mi, sed suscipit sapien. Integer blandit nisi nisi, eget ultricies elit pharetra sit amet. Donec rhoncus leo non pharetra ultrices. Nunc pharetra placerat nisl. Pellentesque consequat erat sit amet urna bibendum, vitae tempus nisl tempus. Proin pulvinar, risus sed condimentum posuere, eros ligula vehicula quam, vitae suscipit dui justo quis mauris. Vivamus a nunc vitae enim hendrerit sagittis.\n\nNulla facilisi. Morbi eget orci non orci vestibulum malesuada a non erat. Donec tempus vitae est vitae sagittis. Curabitur in lacus non enim condimentum dapibus. Nam at felis vitae sem commodo bibendum. Sed et nulla eleifend, pretium ligula quis, dignissim nunc. Etiam placerat nisi vel interdum ornare. Curabitur metus nisl, vestibulum in venenatis vitae, sodales non sem.\n\nPhasellus consequat ullamcorper posuere. Mauris mattis massa condimentum est faucibus maximus. Quisque molestie dictum felis, dictum rhoncus quam feugiat in. Aliquam laoreet augue id libero laoreet, eu rutrum urna molestie. Pellentesque eleifend purus non arcu placerat aliquam. Aliquam vitae est mollis arcu maximus porta. Maecenas tortor risus, porta at tortor sit amet, tempor cursus quam. Proin vulputate magna eget sapien commodo, in consectetur leo sodales. Pellentesque laoreet eros ut dui efficitur maximus. Fusce ut molestie ex. Pellentesque porta arcu molestie tellus tempor, blandit venenatis augue dictum. Mauris aliquam bibendum nunc sed hendrerit. Aliquam sollicitudin eros et lacus vulputate, in luctus tellus mollis. Suspendisse tincidunt consequat placerat. Mauris finibus neque eu velit sollicitudin mollis.\n\nProin lobortis placerat massa, ut faucibus leo hendrerit quis. Quisque at odio ac est sollicitudin fringilla sit amet placerat turpis. In nunc leo, porta eget lacinia ac, placerat quis enim. Donec mattis orci nec ullamcorper finibus. Donec et ligula rutrum, vestibulum quam in, lobortis dolor. Vivamus tincidunt nisi vel tincidunt sodales. Sed semper id eros in finibus. Aliquam iaculis lobortis tempus. Nam ac arcu vel nisl vehicula laoreet. Duis in erat quis tortor tempus finibus.	fish_guy	2020-09-16 13:33:05.961412
e868c84b-97d4-4aa9-ba57-3e49d35144e6	0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada nisl sem, id pretium quam pretium vel. Nam imperdiet magna eu viverra pulvinar. Morbi fermentum dui sem, a tincidunt diam placerat nec. Sed eget rutrum augue, in ultricies quam. Sed et ipsum eget sapien ultrices condimentum. Maecenas mollis egestas pellentesque. Suspendisse nec pellentesque dolor, id finibus nunc. Nulla in ex a velit tristique semper. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\n\nSed volutpat arcu a accumsan bibendum. Ut id luctus mi, sed suscipit sapien. Integer blandit nisi nisi, eget ultricies elit pharetra sit amet. Donec rhoncus leo non pharetra ultrices. Nunc pharetra placerat nisl. Pellentesque consequat erat sit amet urna bibendum, vitae tempus nisl tempus. Proin pulvinar, risus sed condimentum posuere, eros ligula vehicula quam, vitae suscipit dui justo quis mauris. Vivamus a nunc vitae enim hendrerit sagittis.\n\nNulla facilisi. Morbi eget orci non orci vestibulum malesuada a non erat. Donec tempus vitae est vitae sagittis. Curabitur in lacus non enim condimentum dapibus. Nam at felis vitae sem commodo bibendum. Sed et nulla eleifend, pretium ligula quis, dignissim nunc. Etiam placerat nisi vel interdum ornare. Curabitur metus nisl, vestibulum in venenatis vitae, sodales non sem.\n\nPhasellus consequat ullamcorper posuere. Mauris mattis massa condimentum est faucibus maximus. Quisque molestie dictum felis, dictum rhoncus quam feugiat in. Aliquam laoreet augue id libero laoreet, eu rutrum urna molestie. Pellentesque eleifend purus non arcu placerat aliquam. Aliquam vitae est mollis arcu maximus porta. Maecenas tortor risus, porta at tortor sit amet, tempor cursus quam. Proin vulputate magna eget sapien commodo, in consectetur leo sodales. Pellentesque laoreet eros ut dui efficitur maximus. Fusce ut molestie ex. Pellentesque porta arcu molestie tellus tempor, blandit venenatis augue dictum. Mauris aliquam bibendum nunc sed hendrerit. Aliquam sollicitudin eros et lacus vulputate, in luctus tellus mollis. Suspendisse tincidunt consequat placerat. Mauris finibus neque eu velit sollicitudin mollis.\n\nProin lobortis placerat massa, ut faucibus leo hendrerit quis. Quisque at odio ac est sollicitudin fringilla sit amet placerat turpis. In nunc leo, porta eget lacinia ac, placerat quis enim. Donec mattis orci nec ullamcorper finibus. Donec et ligula rutrum, vestibulum quam in, lobortis dolor. Vivamus tincidunt nisi vel tincidunt sodales. Sed semper id eros in finibus. Aliquam iaculis lobortis tempus. Nam ac arcu vel nisl vehicula laoreet. Duis in erat quis tortor tempus finibus.	fish_guy	2020-09-16 13:33:16.656046
caa25822-000b-49b2-93da-f002a18ac6cb	be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada nisl sem, id pretium quam pretium vel. Nam imperdiet magna eu viverra pulvinar. Morbi fermentum dui sem, a tincidunt diam placerat nec. Sed eget rutrum augue, in ultricies quam. Sed et ipsum eget sapien ultrices condimentum. Maecenas mollis egestas pellentesque. Suspendisse nec pellentesque dolor, id finibus nunc. Nulla in ex a velit tristique semper. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\n\nSed volutpat arcu a accumsan bibendum. Ut id luctus mi, sed suscipit sapien. Integer blandit nisi nisi, eget ultricies elit pharetra sit amet. Donec rhoncus leo non pharetra ultrices. Nunc pharetra placerat nisl. Pellentesque consequat erat sit amet urna bibendum, vitae tempus nisl tempus. Proin pulvinar, risus sed condimentum posuere, eros ligula vehicula quam, vitae suscipit dui justo quis mauris. Vivamus a nunc vitae enim hendrerit sagittis.\n\nNulla facilisi. Morbi eget orci non orci vestibulum malesuada a non erat. Donec tempus vitae est vitae sagittis. Curabitur in lacus non enim condimentum dapibus. Nam at felis vitae sem commodo bibendum. Sed et nulla eleifend, pretium ligula quis, dignissim nunc. Etiam placerat nisi vel interdum ornare. Curabitur metus nisl, vestibulum in venenatis vitae, sodales non sem.\n\nPhasellus consequat ullamcorper posuere. Mauris mattis massa condimentum est faucibus maximus. Quisque molestie dictum felis, dictum rhoncus quam feugiat in. Aliquam laoreet augue id libero laoreet, eu rutrum urna molestie. Pellentesque eleifend purus non arcu placerat aliquam. Aliquam vitae est mollis arcu maximus porta. Maecenas tortor risus, porta at tortor sit amet, tempor cursus quam. Proin vulputate magna eget sapien commodo, in consectetur leo sodales. Pellentesque laoreet eros ut dui efficitur maximus. Fusce ut molestie ex. Pellentesque porta arcu molestie tellus tempor, blandit venenatis augue dictum. Mauris aliquam bibendum nunc sed hendrerit. Aliquam sollicitudin eros et lacus vulputate, in luctus tellus mollis. Suspendisse tincidunt consequat placerat. Mauris finibus neque eu velit sollicitudin mollis.\n\nProin lobortis placerat massa, ut faucibus leo hendrerit quis. Quisque at odio ac est sollicitudin fringilla sit amet placerat turpis. In nunc leo, porta eget lacinia ac, placerat quis enim. Donec mattis orci nec ullamcorper finibus. Donec et ligula rutrum, vestibulum quam in, lobortis dolor. Vivamus tincidunt nisi vel tincidunt sodales. Sed semper id eros in finibus. Aliquam iaculis lobortis tempus. Nam ac arcu vel nisl vehicula laoreet. Duis in erat quis tortor tempus finibus.	fish_guy	2020-09-16 13:33:42.447012
ef8403a5-1bae-4978-89bc-d576afa94944	be5569f2-e2bf-4e8d-82ea-224c2a3fb045	here is a comment|\nwith many paragraphs\n	fish_guy	2020-09-16 13:44:41.181309
aa5de9ce-d164-4ae1-bdf5-c2edcd93c65d	33661f21-e0a0-44b4-8ee1-5069de617cd6	Here's a log of feedback	chicken_guy	2020-09-22 10:29:17.527434
e39a21a4-6e44-4155-b6e6-beef0d5914f7	33661f21-e0a0-44b4-8ee1-5069de617cd6	dklafjkd af\nfdjfakljfkalf	chicken_guy	2020-09-22 10:29:28.999768
563d23c9-c148-42c6-b213-a157e762a271	33661f21-e0a0-44b4-8ee1-5069de617cd6	fdsfadfdsf	chicken_guy	2020-09-22 10:29:52.545772
4d721980-f74f-45a3-9324-fdf064d44d7b	caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Sit a tenetur accusantium ex et dolores. Quia velit inventore rerum aperiam. Alias quidem nobis quidem maiores.	Hannah58	2020-09-22 19:19:24.844674
0dfc4770-45b0-4a15-a7b5-d4322306044a	4f20be2f-df81-4fa6-8b74-7e32211a22b8	Voluptates minima sunt alias sapiente qui. Delectus asperiores explicabo et quod facilis.	Haleigh_Farrell31	2020-09-22 19:19:24.845764
c708cb3f-8bec-4aab-9b4f-ef306daa03ba	821f91e3-915a-43dd-89a7-8df33e522565	Aperiam voluptatem quisquam ipsum sint ad sapiente dicta aliquid fugiat. Modi voluptatibus ea voluptates beatae voluptatum porro voluptatem aut ipsa.	Haleigh_Farrell31	2020-09-22 19:19:24.846448
e70b3555-086d-4202-a822-ef1c6a31f515	93b57384-8822-4eee-89cc-64c16ed25a59	Libero voluptates nemo illo at rerum quaerat. Vel voluptas et voluptate nulla natus laboriosam ducimus odit rerum. Nulla perspiciatis sit. Ipsum ullam commodi hic. Provident commodi iste eum repellat et sunt temporibus saepe.	Kirk_Bogisich49	2020-09-22 19:19:24.848758
1822f3bc-a6c0-4fa3-9c72-3323b5f4633c	821f91e3-915a-43dd-89a7-8df33e522565	Deserunt ea quia qui dolorem. Doloribus animi aspernatur ipsa est. Nostrum rerum aut omnis consequuntur autem similique aspernatur neque.	Joan43	2020-09-22 19:19:24.849304
9a313f82-be47-4e89-b31d-a14098a7afef	4ac2f167-736f-4f39-be81-2dbe63991d34	Laborum quisquam officiis. Assumenda ipsa cupiditate accusamus distinctio fugiat nobis reprehenderit tempora architecto.	Maci.Thompson73	2020-09-22 19:19:24.849854
7453fbab-656f-42e4-b5b8-3d50f2149b8d	4f20be2f-df81-4fa6-8b74-7e32211a22b8	Ipsam animi aperiam quia voluptatibus qui in et. Quis dolores rerum a corrupti. Fugit tempore dolor veritatis quos nisi consequatur. Omnis consectetur ut est voluptatem adipisci et vitae est voluptas. Suscipit eius est. Accusantium sapiente velit ipsa quia.	Joan43	2020-09-22 19:19:24.852689
3714997b-4049-4c25-878c-11139b34d430	821f91e3-915a-43dd-89a7-8df33e522565	Aperiam laudantium iusto. Nesciunt aperiam eos mollitia excepturi ipsum fugiat nostrum id suscipit. Numquam similique cum et at. Sed cumque sunt ipsam in.	Hannah58	2020-09-22 19:19:24.853971
a7b419b4-17fa-4da9-8371-40138ab0c737	7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Hic itaque et sit facere ullam omnis. Vel libero laudantium magni amet fugiat qui porro.	Haleigh_Farrell31	2020-09-22 19:19:24.855072
3012be05-812e-42c3-9fe7-6c084030ce1f	4f20be2f-df81-4fa6-8b74-7e32211a22b8	Minus repellendus delectus accusamus pariatur aliquam velit error earum facere. Nostrum veritatis dolorem at eum sit qui dolor. Accusamus rem et. Non omnis est voluptatem exercitationem velit. Ad voluptatem esse sunt sed ut dicta doloremque.	Hannah58	2020-09-22 19:19:24.855584
06c1ab97-87ae-42c7-b41d-8da93795d392	c40dc5ad-3af1-49a5-8778-1553e0132a09	Ut quaerat hic ratione excepturi architecto harum. Ipsam et rerum. Nam facilis ut maxime excepturi provident ut. Sunt quo suscipit beatae voluptatem. Voluptas esse blanditiis dignissimos optio autem asperiores reprehenderit cum.	Rey29	2020-09-22 19:19:24.858981
9f65dd84-2de1-45ab-8f3f-96ec0f65a606	8aa35f89-6206-4ed8-adf8-2b6b431c464d	Hic ipsam atque ut provident tenetur officia quidem commodi. Ex fugiat voluptatem amet. Nostrum dolores eaque blanditiis dolorem non excepturi illo. Nostrum in deleniti impedit est vel maxime libero. Non sed et repellendus doloribus nisi.	Hannah58	2020-09-22 19:19:24.859519
3e911083-9984-4901-a07f-979b094262cf	4f20be2f-df81-4fa6-8b74-7e32211a22b8	Eos soluta ut. Perspiciatis dignissimos similique assumenda dicta cumque non et. Illo consequatur quaerat molestiae nihil. Ea sint non quisquam culpa quia consequatur sed deserunt. Et dolorum consectetur qui exercitationem possimus quibusdam sunt. Reprehenderit commodi sunt ea odit quibusdam quia.	Joan43	2020-09-22 19:19:24.860092
a1dd0855-ae71-4325-8717-297457e11c5b	8aa35f89-6206-4ed8-adf8-2b6b431c464d	Quae officia voluptates eius quaerat. Adipisci quaerat nihil modi excepturi consectetur sit non eaque ratione. Est sed facere. Esse fuga voluptatem. Tempore labore et voluptatibus at expedita consequuntur.	Maci.Thompson73	2020-09-22 19:19:24.861128
1d233eaf-877e-41e1-9204-fba2facf7a2b	7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Nemo voluptatem dolor. Est alias dicta labore ipsam. Illo aperiam qui quod fuga quam est quo aut.	Haleigh_Farrell31	2020-09-22 19:19:24.861759
a9234b0d-b832-4325-a4fe-5d5142ad581b	8aa35f89-6206-4ed8-adf8-2b6b431c464d	Fuga rerum modi qui tempora. Quo quia dignissimos aut expedita impedit soluta autem maxime odio. Eum eveniet incidunt sunt aut quo quae quis et. Numquam ratione nulla quia. Voluptas omnis vel ratione excepturi aliquam nihil.	Kirk_Bogisich49	2020-09-22 19:19:24.863608
1df3c158-e6b8-43e6-9bb8-d60b6dcffc98	8aa35f89-6206-4ed8-adf8-2b6b431c464d	Molestiae aut dolore molestiae. Excepturi magni nihil qui eaque excepturi.	Joan43	2020-09-22 19:19:24.86408
dd865980-5b30-4478-a3fb-0bae9f652697	8aa35f89-6206-4ed8-adf8-2b6b431c464d	Quas sit magni voluptate mollitia quo nisi expedita. Porro necessitatibus cum illo consectetur qui. Architecto molestias sequi molestias repudiandae quia ipsa quisquam eos dolorem. Voluptatem rem placeat ut dolor repellendus nobis quibusdam. Dolorem mollitia explicabo mollitia aliquid mollitia quos officia voluptate. Quas provident deserunt ea facilis vitae odio voluptatibus.	Haleigh_Farrell31	2020-09-22 19:19:24.867136
7b95a954-4bd4-4376-8226-ec0e4e8d3b00	998c3dbe-b97d-4d99-9519-efb08dc9c63a	Fuga dolorum sunt praesentium nobis. Consequatur amet qui vitae aperiam debitis. Sunt voluptatem natus eaque aut explicabo aut perferendis voluptate at. Ducimus atque sunt quia aut saepe in ut qui. Iure qui ut et atque architecto ab.	Hannah58	2020-09-22 19:19:24.867683
0b378bfb-4a8a-4cc5-82fc-351aa9a1b0af	16a0b69d-3582-47c6-ba91-9c8d9d35202a	Aperiam atque dolorem vel placeat dolorum. Voluptas tenetur ut ipsa cumque at provident.	Abner.Ondricka	2020-09-22 19:21:12.269387
1eb4ac5b-dcdc-4b50-bfe6-3efe1e926167	e4d73f59-9133-4093-a52a-b8043b7cdfb4	Ut nihil non non numquam vel quisquam ipsum sunt. Ea minus quibusdam. Quis in est ut dolores voluptas eaque harum harum. Voluptatem aut quia. Beatae excepturi consectetur beatae repudiandae sed sit eos aut in.	Iva_Block61	2020-09-22 19:21:12.241458
d39654fa-0b29-4a9d-8c48-8de0cbf7c03e	6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Voluptatem dolores aut nihil quia dolores laudantium aliquam fuga. Quas praesentium et ea.	Waino.Reilly9	2020-09-22 19:21:12.24363
a30fc9ad-82d2-4d81-ae72-21928dabbcc7	8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Architecto qui voluptates. Consectetur provident magni neque et vel nobis facere quos aut. Tenetur molestias rerum tempore laborum soluta quo nemo eligendi. Minima repellendus eos. Aspernatur aliquam molestias omnis ex aut voluptate facilis. Autem quos est architecto.	Waldo38	2020-09-22 19:21:12.244656
3b79122d-5c75-4f04-9802-292edb5c13d1	8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Velit exercitationem optio ducimus magnam reiciendis qui dicta. Commodi suscipit omnis sed esse. Tenetur culpa voluptatem. Soluta neque quod sed nobis vel ut iusto. Ut inventore pariatur quasi officia.	Golden_Raynor	2020-09-22 19:21:12.245171
f22bf110-bc2e-46b0-8ca9-0c0fc5d39cd8	0d05f1aa-2f12-46f2-a0fa-86e72255635e	Est voluptas error natus voluptatem consequatur aut odio perferendis. Sunt maiores sequi excepturi et. Accusantium sunt sit nesciunt magni enim recusandae aut nam. Unde esse ducimus voluptates quidem consequatur omnis recusandae iure id. Rerum libero ducimus possimus eum accusantium quos. Recusandae illo omnis rerum unde nam labore reprehenderit molestiae.	Sarina58	2020-09-22 19:21:12.245672
2f3eeb41-3fe1-454c-b178-fee07175c22b	bd42868f-fb3c-417c-8ad4-38e85ca821dd	Eaque possimus quasi rerum. Porro ut odio qui voluptate et non unde.	Rudy_Spinka	2020-09-22 19:21:12.246119
a00465e7-6f48-4032-a614-81333014c0bc	5d204e1d-c78d-45bc-9c8a-999656dcb32a	Cumque harum qui quis. Molestias iure minus ratione praesentium ad voluptatibus dolores quos libero.	Mose77	2020-09-22 19:21:12.247544
468f7cf6-77a6-4fa0-9e86-04af995a339c	2d4f306b-af00-4179-bc53-d3fd89875ba0	Expedita nemo vel in nemo non explicabo dolores voluptatem. Reiciendis aliquam esse nulla commodi. Suscipit laborum soluta et veniam quae suscipit aliquid. Soluta iusto consequatur nisi tempore.	Reba_Maggio35	2020-09-22 19:21:12.24797
f22979e6-6d30-45e7-9fb2-63dccb3476b5	d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Earum qui dolorum est excepturi corporis quia maiores. Sit harum est suscipit quam deleniti animi eos quo quo. Aspernatur dolores nobis. Ab culpa quis quasi esse laboriosam minima perferendis. Nam et et unde dignissimos sunt sint est.	Velda_Davis	2020-09-22 19:21:12.248395
9669af76-b4bf-45f6-b3ef-e0b1aed1e229	8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Excepturi provident velit impedit sequi optio qui ut sed. Hic neque libero doloribus.	Tod_Streich2	2020-09-22 19:21:12.251276
16db30d3-bd9a-4d74-931f-a8e6daff1b1f	adc2f6ed-a31e-43e4-9493-6a18866158d1	Dolores error quo. Debitis amet ipsam et optio. Deleniti doloribus qui omnis veniam. Occaecati est corporis nesciunt. Voluptatem et aperiam ex tenetur error vero.	Glen_Krajcik13	2020-09-22 19:21:12.25173
44a27216-b2ec-45ac-8eff-5908831b9dba	96b2311c-d26f-4462-a29c-a94753161467	Quas omnis id. Dolor placeat repellendus saepe quaerat reprehenderit omnis necessitatibus dolor eligendi. Ad delectus vitae et ea. Explicabo aperiam unde optio in voluptas dolorem et.	Rudy_Spinka	2020-09-22 19:21:12.252154
2e9b45c5-3684-4c8a-8328-424fa51d251c	8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Aliquid omnis aperiam repellat eum. Cupiditate omnis repellendus voluptatem explicabo quia recusandae cupiditate. Rerum quas vel autem. Repellat consequuntur officiis cupiditate non optio facere et aspernatur. Rem eos et est et.	Lindsey38	2020-09-22 19:21:12.252603
183f3c0b-05d0-4767-a842-cf44f1579529	58a21a0f-bcbd-4793-9917-e7ed67ee551a	Aut voluptate qui eius nemo veniam nihil et illo eaque. Natus quia numquam soluta ratione quia est dolores perferendis occaecati.	Tod_Streich2	2020-09-22 19:21:12.253967
eaf5ffc0-6103-4960-9d77-36ec44427233	5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Earum aut quod totam repellat. Tenetur quaerat aut modi enim nisi ea quibusdam laborum. Molestiae cupiditate recusandae temporibus sit sed similique rerum. Ea laudantium ipsa totam consequatur voluptatem reprehenderit rerum. Iste repellendus consequatur laudantium sint et sit quasi voluptate. Ducimus architecto placeat tenetur.	Camila_Schiller80	2020-09-22 19:21:12.255053
3d92829d-9b09-4d35-95db-b7d6f92d88ac	69199805-05c7-4301-8c05-868f29e606d6	Non quis laudantium consectetur laborum accusamus. Molestiae voluptate et et.	Mathew82	2020-09-22 19:21:12.312145
bb52aab1-0e92-48a3-8d3d-8cc72d9b7d55	96b2311c-d26f-4462-a29c-a94753161467	Quisquam culpa odio itaque officiis odio amet voluptatem similique sit. Repellendus rem facere temporibus iste delectus ad vel molestias officia. Quam voluptatibus quam fuga.	Dedric.Bartell	2020-09-22 19:21:12.256535
d6a92073-0048-4398-a61b-c19df8b8758e	2508c094-ff79-4881-b756-74234df008f2	Recusandae dolores beatae sapiente. Numquam quos velit voluptatem. Mollitia perspiciatis omnis nulla.	Dee86	2020-09-22 19:21:12.257398
4ed92a4d-11d6-4169-93e8-2a992764181a	3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Iusto quia est. Ipsum mollitia a veritatis quis et. Iusto et exercitationem eaque sit sequi.	Kimberly.Becker	2020-09-22 19:21:12.25935
b23d53b0-4eb4-4ac8-b7d5-329536506b1a	0a5df6a2-52b4-452a-b91e-3ffb6de09944	Iste quia sit beatae tempora et qui magnam ipsa vero. Suscipit natus vel. Dolores non et sunt nihil voluptatem. Qui incidunt totam. Labore aliquam aperiam alias odio. Quibusdam sed ratione qui molestiae saepe hic modi nisi sunt.	Samanta46	2020-09-22 19:21:12.259858
9bd7a54e-5f5e-45ab-b414-c1cecfbbd922	2d4f306b-af00-4179-bc53-d3fd89875ba0	Voluptatum voluptatem dolor adipisci consequatur accusamus. Molestiae eos praesentium magnam rerum. Velit laborum ipsum voluptatem qui cupiditate delectus quod consequuntur accusantium. Est quibusdam omnis alias quisquam fugit eligendi fugiat vero sequi. Quia maiores accusamus quos doloribus ut reiciendis et quibusdam. Similique voluptatibus non temporibus repellendus in.	Ethel.Jacobs	2020-09-22 19:21:12.26031
798dc6c1-74df-49ed-aecc-adaa648951dd	8517aab1-684c-4f3c-bf4d-af4df17e511e	Qui sit sed odit consequuntur eum. In ipsum aliquid. Quia temporibus id numquam qui ea. Laudantium odio nam.	Consuelo.Cartwright99	2020-09-22 19:21:12.261201
52f9c70b-7fa7-4c3c-b2f0-59d91c127d0a	885df98a-8a7a-49d2-aba4-86d08b804cb4	Non accusantium consequatur illo. Mollitia velit eaque nisi voluptas dolores in sequi distinctio. Impedit deleniti pariatur qui omnis voluptate cumque. Quam dolor eius et dolor magni vel. Fugit ea impedit.	Lonnie_Gleason	2020-09-22 19:21:12.261728
33c23602-a901-4af9-91b0-7b0c83f3dd3c	adc2f6ed-a31e-43e4-9493-6a18866158d1	Sunt corrupti quasi. Quasi quia qui quo aut doloribus sit. Nesciunt ipsa perferendis repudiandae sit aliquam. Non libero vel enim.	Breana23	2020-09-22 19:21:12.263067
b7ad04fe-5f13-4b69-88db-22209f043793	2fd317ca-6aeb-401d-af6c-92bcce6f5943	Cum quia provident ab ab iure cumque. Suscipit blanditiis aperiam quod. Tempore temporibus distinctio molestiae quia dignissimos. Eaque veritatis asperiores consequuntur asperiores et ea. Voluptas nostrum et animi. Ratione deserunt nemo.	Naomie.Prosacco	2020-09-22 19:21:12.263976
0364de80-b2b2-490b-85a6-b8b6d8d61826	d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Vel et voluptates inventore aliquid. Consectetur hic molestias nemo. Autem et consequatur nam aut beatae distinctio repellat. Soluta laborum neque vel sit. In neque ab. Nihil est eligendi dicta consequatur sed cupiditate deserunt voluptatem sunt.	Cristobal.Hickle	2020-09-22 19:21:12.264814
7d6727a8-ae08-49d7-87af-3e894bd94252	c9d6d7f8-eb89-4f85-8474-0767c578a03d	Ea rem inventore sed dolorem tenetur iure voluptates expedita vel. Iste quia facere praesentium dolorum. Corrupti esse nobis omnis quod. Ea aut aliquid nisi eveniet eos quibusdam. Dolorem in aut molestiae. Voluptate modi dolorem corporis qui est iusto architecto.	Darwin64	2020-09-22 19:21:12.265796
cc614c6f-a3a3-434e-97ce-43b9062a2133	8517aab1-684c-4f3c-bf4d-af4df17e511e	Delectus omnis et nostrum aut accusantium aut dolor. Quia repudiandae dolores quia at. Quas fuga enim voluptatibus placeat velit voluptas ut. Est eos adipisci excepturi nobis perferendis vel repellendus. Distinctio qui molestiae omnis eius libero voluptas aut distinctio. Eos ut ipsum itaque ipsum ea.	Murl97	2020-09-22 19:21:12.266298
028a4f0f-7b3e-4456-8b5a-0f5724d1ec04	58a21a0f-bcbd-4793-9917-e7ed67ee551a	Numquam quis nesciunt qui accusamus mollitia est minus. Et ut eum odit libero ducimus. Et accusantium voluptatem est praesentium quasi voluptas commodi omnis autem. Voluptate molestias numquam sint. Qui quam libero autem. Provident ea odio voluptatum odit ea aperiam harum.	Bridie.Kilback	2020-09-22 19:21:12.267617
de5a0f5b-307c-47f3-989e-fe83b63a31fc	d6295f45-ff33-4b75-9be1-c59902d1e9b8	Voluptatem ad dolor voluptatem. Sit et ut asperiores. Dolorum voluptas autem qui dolor repellendus ut ea sit aut. Consequatur sed id ipsa.	Waldo38	2020-09-22 19:21:12.268045
83eb54ba-a830-46b1-812d-81aeb1e4767f	8592ac88-a537-40f3-b024-c5b90b11a69d	Voluptatem iste et earum aspernatur cumque non quis et. Tempora nisi vero illo inventore itaque magnam qui. Veritatis aut sint harum et tempore voluptate soluta. Esse hic nostrum. Aliquam nemo aut architecto molestiae pariatur doloribus molestiae non omnis. Et voluptatibus ipsa debitis voluptatem quidem sed harum accusamus.	Jana_Collier	2020-09-22 19:21:12.268908
00c5f3fb-c6ac-4e8b-b6cf-3886b7834551	c8a81b45-cea1-4938-b2bd-5849fea7060d	Quo et fugit molestiae a ut laboriosam a. In eveniet in. Dolores tenetur modi consequuntur ut repellat.	Willard85	2020-09-22 19:21:12.269814
ec3bd57d-ec9e-4f12-93dc-1e717f417380	2d4f306b-af00-4179-bc53-d3fd89875ba0	Saepe quae natus magni iste sequi qui provident. Explicabo est expedita labore autem. Alias quae magnam eos autem inventore sint et ducimus.	Jalyn.Schaefer56	2020-09-22 19:21:12.271158
6acdea0a-e1cb-4d55-9d14-6b3c25c2932f	80e81930-37e1-4b4e-9706-cbaf9f163ad6	Quia quia voluptatem velit perferendis cumque. Repudiandae rerum molestiae commodi velit debitis esse.	Jalyn.Schaefer56	2020-09-22 19:21:12.271625
b6f888ad-85cd-47dd-8abc-4605b9bfba9f	1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Adipisci ex optio est. Necessitatibus ad blanditiis. Sint magni eos ab et beatae inventore dolorem sit delectus. Veniam enim neque eum incidunt soluta asperiores neque est. Eum commodi quam incidunt et necessitatibus vel dolores. Et perspiciatis et voluptas tenetur ullam quo.	Morgan_Borer	2020-09-22 19:21:12.272054
0db1c8c3-40ae-4158-a909-29673432821b	532a613b-9be2-43e4-82f4-ddce03d99630	Non voluptatem corrupti neque illum neque qui necessitatibus. Aperiam consequatur beatae nisi sit dolores et molestiae quia porro.	Daphney_Grimes36	2020-09-22 19:21:12.273999
8ac835c9-4bc2-4731-aa6d-fe336412affb	c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Omnis voluptatem quisquam. Delectus maiores in quae quos magnam facere ut doloremque. Culpa rerum maxime officiis cum omnis beatae dolorem rerum vitae. Rem ut quisquam est voluptas et doloremque ea.	Fritz.Keebler	2020-09-22 19:21:12.274446
08137291-93f1-42d7-9d49-06293acd4fe8	fa22a469-463b-44c5-b0f0-63a24be82fef	Sed voluptates error sapiente. Cum nesciunt sit quam sint dolor dolores. Nobis aut a sequi sed dolores. Sit sint ratione. Facilis dolorem rerum temporibus inventore id incidunt suscipit. Corporis quos alias est.	Herta18	2020-09-22 19:21:12.274881
044706e4-1aac-427c-9b99-3e662effe4d9	aa91db1f-fd7e-4869-92b6-2ed892ba1621	Sed ut officiis quidem possimus culpa rerum mollitia est voluptatem. Et quis iste repudiandae dolorem quam maiores quam. Tempore aut suscipit aut a nihil inventore odio aperiam. Odio corrupti voluptas eum aut.	Cristobal.Pfannerstill27	2020-09-22 19:21:12.276242
56e24d46-01e8-400b-92b7-c5b79a687472	532a613b-9be2-43e4-82f4-ddce03d99630	Natus accusantium voluptate est tempore. Reprehenderit exercitationem possimus praesentium. Et et autem impedit enim eos nobis laborum repellat.	Mathew82	2020-09-22 19:21:12.276677
960d87ee-f2f1-4ba7-99b3-efb3c2d0080f	c9d6d7f8-eb89-4f85-8474-0767c578a03d	Ipsum rem dolores quod aliquam incidunt tempore sit sint iste. Aliquid fuga facere ratione. Blanditiis nisi cum ut natus.	Leta2	2020-09-22 19:21:12.277505
60088f8e-d9de-4d8d-98fc-6adee7295ba1	bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Iure quod necessitatibus aut in dolor est est quas. Vel ea ut molestiae. Aut qui quos perferendis.	Hector_Mraz33	2020-09-22 19:21:12.277917
02c4070e-adb0-4c72-ad5b-a73675f2427b	0d05f1aa-2f12-46f2-a0fa-86e72255635e	Sint voluptatem aut. Nulla aut eveniet autem aut eligendi dolorem ipsum fugiat. Unde quia cum quas molestiae consequatur molestiae.	Elta.Bernhard	2020-09-22 19:21:12.279233
7574724a-8dae-4e40-9c8b-c7c166f47327	b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Vel qui consequatur dolores aut. Quo ducimus esse cumque ut.	Morgan_Borer	2020-09-22 19:21:12.279653
727ef28b-988b-46aa-a331-2339fb9ed3d8	60d195d0-3674-4b1e-b907-553b0d57d8be	Qui autem laboriosam quaerat et. Natus quibusdam repellendus. Repellendus non repellendus unde adipisci nulla cumque veritatis. Nulla adipisci labore quam qui porro fugiat soluta quis pariatur. Neque animi dolor et ipsum illo architecto odit eaque. Dignissimos debitis odio.	Johathan16	2020-09-22 19:21:12.281314
8ab1ae54-be16-4823-b58f-16e9c1eabc1d	80e81930-37e1-4b4e-9706-cbaf9f163ad6	Optio ea laborum autem quo non voluptas explicabo natus. Autem alias quia culpa enim voluptas adipisci mollitia animi. Maxime vero quasi rerum mollitia delectus. Perspiciatis delectus nemo quia consequatur debitis blanditiis.	Melyssa_Halvorson	2020-09-22 19:21:12.281725
be9a472d-3190-4489-a09d-238d12e610ff	2fd317ca-6aeb-401d-af6c-92bcce6f5943	Quam id mollitia occaecati fugiat consectetur est ut. Nihil maxime ex consequatur non et. Vero sint hic quos.	Morgan_Borer	2020-09-22 19:21:12.282237
6367c9b9-9514-46d5-be17-e503d5c64c02	3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Non iste laudantium excepturi est nihil eum omnis ullam cum. Quo sed modi sit amet explicabo illo.	Glen_Krajcik13	2020-09-22 19:21:12.282675
3859ba20-0151-47c0-8ccb-d0ff209f2c84	970eed6e-3a47-42a9-b90b-a3c049f96751	Est aut labore autem ipsam eius iste incidunt et exercitationem. Aut soluta et qui. Debitis officiis ut et.	Elizabeth.Sawayn	2020-09-22 19:21:12.283378
30cd1c44-26da-4839-ad0e-00493aed813c	69199805-05c7-4301-8c05-868f29e606d6	Provident tenetur iusto placeat. Incidunt praesentium sapiente amet. Dolor facilis minima. Ut repudiandae dicta eum dolor eos. Debitis hic dolorem. Ut similique vel illo ullam alias impedit ut repellat.	Rahsaan.Breitenberg	2020-09-22 19:21:12.284289
1efcdecd-34d6-4e4d-b27f-b46db3366480	3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Voluptatem quaerat exercitationem laborum laborum rerum aliquid cum excepturi. Est voluptas quia. Est beatae inventore velit vitae mollitia. Iste nesciunt esse.	Danyka_Osinski	2020-09-22 19:21:12.284772
96c39878-1e04-4cc7-81cc-52290083de64	4889ed0c-8b6e-42b6-8a14-9819098eb223	Deserunt fuga libero ratione est culpa consectetur saepe. Eum doloribus aspernatur autem. Incidunt deleniti non in eius aut dolor odit. Non id atque rerum sit dolores quia quae dolore.	Adelle38	2020-09-22 19:21:12.285194
347e4f9f-5383-4f0a-bae5-6cc3858ca727	ad98a18b-91de-4949-aba6-8c04c523dd81	Aperiam culpa enim. Vel beatae sit similique id et ratione quo suscipit. Dicta occaecati consequatur fuga rerum omnis odio. Ut quam perferendis ratione ut rerum qui sit.	Zoe.Hudson65	2020-09-22 19:21:12.287373
483b0bc9-3e54-40c5-b9a1-918cae5ad8ff	0d05f1aa-2f12-46f2-a0fa-86e72255635e	Quia aut hic soluta. Exercitationem sed iste autem aut ut molestiae. Deserunt eum sed laborum ipsum accusantium quia qui facere.	Joey.Tremblay67	2020-09-22 19:21:12.287818
2c6c407d-ccd0-4afa-949d-b2279ff37ec8	d6295f45-ff33-4b75-9be1-c59902d1e9b8	Velit ut quam. Qui itaque aliquid pariatur laudantium. Vel sunt odio laudantium. Modi laudantium necessitatibus. Quis distinctio voluptatibus maiores.	Velda.OReilly24	2020-09-22 19:21:12.288228
9c676ce1-3fae-4051-802d-94bfcc1bb7eb	8517aab1-684c-4f3c-bf4d-af4df17e511e	Omnis sapiente omnis fugit repudiandae ipsam veniam. Commodi laudantium voluptas sed et cupiditate omnis.	Elizabeth.Sawayn	2020-09-22 19:21:12.289589
3bc363cd-7b71-4556-95f3-6b748ce23ac7	9ecd078c-de1f-40d0-9455-925e4c2c2213	Voluptate quaerat qui. Dolores quia quaerat voluptate sint. Et et culpa repudiandae qui aliquam provident. Dolorum recusandae est quas ipsam officiis. Excepturi magni qui numquam. Ut possimus earum vel aliquid.	Mattie_Wiza	2020-09-22 19:21:12.291208
c18ca91c-155e-4f8b-b009-9d97a33b7a7c	2fd317ca-6aeb-401d-af6c-92bcce6f5943	In facere consequatur nam ullam rem quia praesentium quam. Qui quos temporibus ut. Animi occaecati in.	Zechariah.Sipes55	2020-09-22 19:21:12.291624
0dc3dcf2-d0be-4c2a-a968-d6a2b5e36197	3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Expedita sit sint ut eveniet provident voluptas porro necessitatibus fugiat. Velit et deleniti aliquam rerum non labore. Sed voluptates sint id consequatur veniam. Aut quae eaque sint qui et rerum delectus est.	Herta18	2020-09-22 19:21:12.292477
e0f01b49-ed90-4f8c-a6d6-cba163b614e1	60d195d0-3674-4b1e-b907-553b0d57d8be	Aut ea tempore iste tenetur nobis culpa. Placeat quo quas cum tempora accusamus aspernatur qui. Dolor deleniti vero alias rerum. Ab quia sed qui velit dolore hic fugiat eaque. Quisquam rerum laborum est consequatur perspiciatis.	Willard85	2020-09-22 19:21:12.293348
e836569a-db62-4bdf-b7eb-8f677b0aa6ed	29e9c646-3623-4216-ad73-b7a1256a7d8e	Qui in quidem. Perferendis ut sapiente occaecati eos consequatur libero. Possimus iure optio facilis error aut tempore enim ea. Maiores omnis voluptates repudiandae fugit omnis similique labore. Minus non mollitia voluptate enim consequuntur voluptatum ut nesciunt.	Melyssa_Halvorson	2020-09-22 19:21:12.293766
b116c6f8-4a41-4693-9514-f6afe64e8438	108e57ac-5c11-47db-a106-fc3963f7b58d	Neque autem fuga. Et nobis ducimus ut. Tempore et est non et cumque eius. Quia dignissimos assumenda fuga voluptatibus fugiat.	Iva_Block61	2020-09-22 19:21:12.294177
8b9ed6b2-6b32-4b27-b49b-7966a93fce4b	58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Nihil fuga exercitationem. Fugiat voluptates nam.	Elvie25	2020-09-22 19:21:12.295056
c96e5554-2836-4ac0-bd4a-9d45315a47e1	58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Ut ullam aliquam natus iure. Sit porro quam quis esse. Omnis perferendis at ut autem consectetur repellat assumenda.	Rahsaan.Breitenberg	2020-09-22 19:21:12.295862
8db623f7-67bb-4e68-a933-ebb5af319831	80e81930-37e1-4b4e-9706-cbaf9f163ad6	Tenetur aut vero eius eos. Molestiae sit est quia veniam aut sapiente. Dolorum possimus et nisi.	Elliott62	2020-09-22 19:21:12.296288
53d2c5b5-d11b-4b24-8b8e-478f07d674d4	16a0b69d-3582-47c6-ba91-9c8d9d35202a	Maxime omnis praesentium reiciendis officiis neque dolor ducimus suscipit ut. Repellendus facilis soluta dicta. Repellendus voluptas sunt sequi laboriosam. Praesentium sit voluptas asperiores sint perspiciatis qui quidem. Ea aut tempore ducimus. Porro voluptates culpa et quia voluptatibus dolore.	Edwardo48	2020-09-22 19:21:12.29671
01933ec0-0a93-4526-892c-2c52f535a3a2	944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Sed nulla ut illo ab tenetur voluptatem. Hic quibusdam vitae aut eos. Et facere rerum distinctio sed et autem libero eligendi. Et qui delectus ullam optio. Adipisci est laboriosam dolores voluptatum vel. Hic ad omnis quis voluptatem.	Josue.Hilpert15	2020-09-22 19:21:12.29715
3843e656-6a67-4663-9072-885a58c5e252	80e81930-37e1-4b4e-9706-cbaf9f163ad6	Animi tempore exercitationem ipsa dignissimos eos et sed odit. Corrupti hic labore quasi veniam et officiis ipsum eligendi dolor. Sint nisi neque id vel nulla in. Ut vitae magni fugit ducimus et. Nihil et molestias est libero. Sequi aliquam at non minima ut sit.	Flo.Watsica	2020-09-22 19:21:12.298021
01249687-86b3-434f-a6a3-82b848d5fcf3	ee95e078-4299-4cb4-a596-d4348d73e21a	Eius dolore rem. Consequatur in qui et dolorem doloribus. Ullam dolorum aut ut corporis ut aut et. Quod non voluptatem fugiat. Consequatur dignissimos qui dolor perferendis.	Eulalia.OConner	2020-09-22 19:21:12.298483
32509a09-13a2-4d1b-81ee-dec7dedcffeb	3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Exercitationem et dolorem quibusdam placeat voluptates quibusdam nam. Consequatur qui sed blanditiis. Quibusdam ut ut accusamus id aut quia. Quibusdam totam et totam.	Sallie_Fisher	2020-09-22 19:21:12.299821
3618329f-24c8-4ddb-8c47-8818c475803c	2d4f306b-af00-4179-bc53-d3fd89875ba0	Eum animi accusamus eligendi deserunt necessitatibus. Voluptates quae perspiciatis debitis laudantium blanditiis culpa voluptate.	Ronny_Zemlak20	2020-09-22 19:21:12.300643
00d99b1a-44f3-4f0c-ab88-33492138e0ce	2d4f306b-af00-4179-bc53-d3fd89875ba0	Adipisci vero rerum neque voluptatem cupiditate delectus placeat non illo. Laudantium distinctio aut eligendi odio consequuntur necessitatibus et iste.	Zoe.Hudson65	2020-09-22 19:21:12.301048
11b74d47-16a0-4935-be3d-776f0d1283c3	944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Vero error aperiam nulla explicabo quo. Qui deserunt quo nihil quibusdam dignissimos nam.	Jean_Leffler	2020-09-22 19:21:12.302783
ecc2a154-ce86-4233-a986-c7e401435f74	e6030f49-4156-4c69-8aed-805cb4f8382a	Porro eius ea sunt cupiditate est ea consequatur. Nostrum deserunt ut totam minus maiores voluptatem dolorem sint. Deleniti iste modi repellat expedita deleniti ut quo. Odio fugiat aut a maiores temporibus numquam.	Darwin45	2020-09-22 19:21:12.303191
a28966fc-ca83-4700-bf78-12a22d9288a7	9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Beatae in et. Fugit veniam neque aut corporis voluptas. Incidunt fugiat odit et mollitia. Nihil accusantium quia perferendis est.	Mathew82	2020-09-22 19:21:12.303601
ee27bb9e-75b2-40a6-ac2d-f4e1655dd6cf	58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Molestiae assumenda optio voluptatibus. Autem quo voluptates qui fugit sit impedit porro similique quo. Eum aperiam in tempore sint nihil distinctio sed possimus.	Kirsten.Reilly	2020-09-22 19:21:12.304911
1de82ebd-f831-4cfd-af4d-b16085b7af24	020f3109-5d91-4cdc-936d-b60387e8f326	Officiis quasi quasi quasi alias sed nobis dolore pariatur. Dolor perferendis et consequatur dignissimos deserunt laboriosam ducimus qui itaque. Molestiae necessitatibus aut. Accusantium distinctio et.	Kaylah_Konopelski67	2020-09-22 19:21:12.305327
71e6fb99-baef-4a59-ab2c-87b73a030fde	3e7dfef9-b496-460c-a24a-9e90bc06c658	Nesciunt omnis nesciunt natus molestiae autem dolorem. Sunt et animi et et sunt quo. Pariatur illo iste voluptatem. Quisquam dolorum quam.	Raphaelle17	2020-09-22 19:21:12.306186
32a487ea-aa8b-4e41-874d-9d6b83d996e4	8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Dolorem incidunt consectetur labore est aut aut quia aliquam ut. Non qui quo quasi voluptatem. Officia adipisci suscipit perspiciatis error aut adipisci eveniet maxime officiis.	Hubert_Goodwin	2020-09-22 19:21:12.307217
b0ebc8ec-133b-44e5-aa3c-17d324993203	ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Ut recusandae aut asperiores. Atque totam velit quia fuga soluta. Fugit alias laudantium facere ipsam ullam eveniet magnam non magni. Id dicta autem modi reprehenderit aspernatur. Earum nostrum molestiae ea culpa blanditiis eveniet laborum dolor dolorem. Facilis qui eum qui.	William_Hagenes89	2020-09-22 19:21:12.30933
e310d288-1f8c-41ff-8a82-ba32c88df9c8	859aea6f-f0b3-4d5c-a417-efcab8d37363	Aut perspiciatis libero est omnis et et quis minima. Qui est quibusdam praesentium velit voluptatum. Assumenda laudantium tempore nesciunt cupiditate aliquam illo alias ducimus.	Rhoda98	2020-09-22 19:21:12.310388
e36c6050-a20f-425b-b103-2d1a81fe0745	1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Voluptatum molestiae dolorum fugit quod qui dolores. Facere fugit iure ratione. Corporis quidem et et exercitationem omnis debitis sed. Saepe illum eveniet sit. Consequatur qui delectus.	Danyka_Osinski	2020-09-22 19:21:12.311752
026a2563-94a9-4539-bb54-d6b9737630d8	596b6c27-1c6e-4870-83f6-3cef204cfc5e	Officia eveniet fugit accusamus incidunt at exercitationem vel eaque laudantium. Libero molestias vel vel voluptatem ex quam. Voluptatum eum commodi maiores veritatis reiciendis quaerat voluptatem. Doloremque ut dolorem molestias similique illo sed maiores. Explicabo quasi asperiores repudiandae porro atque deleniti laudantium et doloremque.	Malika86	2020-09-22 19:21:12.312616
c6555bc0-17c4-4021-bb3d-c19c731195d8	e6030f49-4156-4c69-8aed-805cb4f8382a	Neque aperiam blanditiis vel. Ut molestias doloremque impedit velit voluptatem et.	Brayan_Hoppe86	2020-09-22 19:21:12.313504
5930b249-8fab-4818-8a66-46e10cb69861	1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Eos aut incidunt ipsa eum. Ut dolor aspernatur minima. Vero vel libero qui ipsum voluptatibus sint porro error consequatur. Sit voluptatem repudiandae vitae necessitatibus. Est sint facilis in est. Architecto et perspiciatis dolores quod reprehenderit in assumenda aut aut.	Rosa.Howe52	2020-09-22 19:21:12.31398
9947e2aa-2f8e-4f3f-b768-5ceaea34b10d	ee95e078-4299-4cb4-a596-d4348d73e21a	Qui numquam similique corporis rerum cum omnis labore totam sint. Dolorem alias eaque vel accusantium rerum non in et. Rerum illum ipsam quidem.	Jana_Collier	2020-09-22 19:21:12.315238
27e4d1ac-e653-4c5a-bae5-b951709e47cc	aa91db1f-fd7e-4869-92b6-2ed892ba1621	Explicabo eum recusandae facilis et consequatur ipsa quo corporis. Iste voluptas et dolorem ut sapiente deserunt est ab.	Morgan_Borer	2020-09-22 19:21:12.317082
43c8c012-893a-4ba9-81b4-bfd6abc88040	8592ac88-a537-40f3-b024-c5b90b11a69d	Aliquid rerum voluptatum enim ex distinctio corrupti et illum. Laborum sequi beatae. Atque eaque est quis aut id exercitationem pariatur. Et saepe voluptatum. Fugit temporibus blanditiis sunt nam eius vel maxime nisi.	Veronica.Satterfield42	2020-09-22 19:21:12.317498
51ff99c3-0dce-4f91-b46d-19b0928e88af	38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Laborum dolorem libero ut amet neque incidunt debitis ea sequi. Eius eos cupiditate earum odio quas omnis magnam quos. Soluta perferendis ea atque nobis et repellendus ut. Omnis iure assumenda mollitia magnam. Porro exercitationem sed deleniti tempore quae.	Fern33	2020-09-22 19:21:12.317921
2040a280-817a-4ca1-905a-d7363cf41df7	23c943e0-2ea7-42c7-9112-c77c08073122	Dolorum ratione aliquam sit repellat eos nihil. Sed molestiae laboriosam eum nihil numquam rem similique unde.	Melyssa_Halvorson	2020-09-22 19:21:12.318787
ec6112e5-28cf-4381-98ec-63f914e89ecf	3e7dfef9-b496-460c-a24a-9e90bc06c658	Id non voluptas. Quis ut quis. Consectetur est eos. Architecto rerum illum corrupti earum consequatur omnis ab. Voluptas molestiae accusamus at eius dignissimos quibusdam. Expedita assumenda consequatur est sit magni.	Mattie_Wiza	2020-09-22 19:21:12.319657
4d6f500c-44d7-44a0-8bbd-f4ed65ef68d6	a5f32e66-acb4-44b6-979e-4657a4e3caab	Minus et qui sed. Et quod voluptatibus libero quos vero unde molestias voluptatum. Dolor molestias qui sapiente. Voluptatem nisi et et exercitationem nulla autem. Alias eum sit accusantium maxime in laborum. Corrupti ut expedita est provident velit ut aut.	Veronica36	2020-09-22 19:21:12.320575
ce6f4f0f-2993-4119-abcd-afff11fbb6fd	eeba34a2-1e00-4c93-af95-b70b4670c5a2	Omnis id cum. Et ipsa ipsa et nobis hic in quos. Dolore nihil placeat assumenda. Deserunt sint qui eligendi dolorem facere tenetur delectus dolores fugit. Molestiae assumenda natus voluptatem temporibus dolorum sed ut est.	Kyra_Heidenreich	2020-09-22 19:21:12.32099
90e0214f-24fa-4ed7-90ab-5ec0fb5d2544	a5f32e66-acb4-44b6-979e-4657a4e3caab	Qui consequatur perspiciatis laudantium dolores consequatur vel similique. Ipsa et nobis id soluta.	Sunny_Anderson	2020-09-22 19:21:12.321825
00d80226-e2aa-4d6f-b7b8-873d85d5a94b	2508c094-ff79-4881-b756-74234df008f2	Ut sint quis molestiae. Qui voluptas ut nemo est.	Leta2	2020-09-22 19:21:12.322231
3bf3d56b-b96e-4738-aa7b-7e6e1b6ad18e	c9d6d7f8-eb89-4f85-8474-0767c578a03d	Sunt voluptatum ipsum in molestiae. At laudantium voluptas similique fugit enim molestias. Dolorum quos qui blanditiis repellendus.	Elijah_Gulgowski59	2020-09-22 19:21:12.323099
70eac164-8996-4f54-829e-9749346b628e	4889ed0c-8b6e-42b6-8a14-9819098eb223	Et repellat totam sint et qui. Impedit at consequatur ratione qui facilis. Velit sit sequi animi excepturi totam beatae. Harum aut aperiam. Rerum quaerat distinctio tempore voluptate. Quis est veritatis.	Christopher_Senger	2020-09-22 19:21:12.323511
b12a12df-9563-4c7a-ae59-5a704881acc8	6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Vitae velit provident. Voluptatem aspernatur nobis quae nesciunt. Consequuntur quae impedit ut fugiat laboriosam blanditiis pariatur omnis. Autem eveniet animi et officia enim voluptate ea.	Shad_Prohaska	2020-09-22 19:21:12.324405
95a3dfcc-412a-44fc-b820-f1579f53abc9	8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Ad itaque tenetur aut molestiae illo et voluptates dolores mollitia. Sunt magnam atque explicabo dolorum ipsa quas enim. Iste eos est tempore expedita impedit illum doloribus assumenda.	Malika86	2020-09-22 19:21:12.324915
e6bdafb7-d8fb-47b3-8944-78d19ce895bb	1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Consequatur ab et dolore et illum et alias quis voluptatem. Non et aut consequatur non vel id sapiente quia nemo.	Camila_Schiller80	2020-09-22 19:21:12.325323
9f17d158-71fd-4c79-8526-153762504da4	58a21a0f-bcbd-4793-9917-e7ed67ee551a	Et sed accusantium illum. Dolorem vel voluptatem.	Kali.Moen	2020-09-22 19:21:12.326279
f7b12b9d-ab82-4a91-9c19-74d08744dcad	cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Reprehenderit nisi aut ab aliquam in. Vel recusandae nesciunt repellat nesciunt pariatur labore. Qui expedita voluptate rerum excepturi. Nostrum aliquam illum quasi quisquam esse quia ut ducimus. Aliquid velit voluptatibus et facere fugiat.	Darwin45	2020-09-22 19:21:12.326698
df74ee3e-9dba-493b-8af9-3e68e9442fa6	0a5df6a2-52b4-452a-b91e-3ffb6de09944	Perspiciatis quaerat dolorem consequatur commodi. Doloremque voluptatem voluptatem aut est. Vel fugit magni nam ratione et odio odio harum aliquam. Asperiores delectus et nesciunt officia eos. Eligendi laudantium ea beatae in reiciendis omnis iure provident ea.	Curt_Jerde	2020-09-22 19:21:12.327663
067ff286-6a8a-4022-9229-e5c05b927d1e	3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Occaecati aut et. Itaque voluptatibus libero ab perferendis earum sed est iusto ad.	Larry_Sawayn	2020-09-22 19:21:12.330677
cc75c19f-c843-4d6c-83b9-ceb3f4d499bb	6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Vero voluptatem natus quos voluptatem. Quam atque sint facere. Iure et et esse assumenda eaque at. Quisquam atque beatae. Consequuntur sit iusto voluptas dolores. Architecto sapiente accusamus.	Callie.Rohan24	2020-09-22 19:21:12.331101
f49ac46b-de6b-4d1c-b94d-f2adda8b63cd	3e7dfef9-b496-460c-a24a-9e90bc06c658	Quia quod in inventore numquam. Ut nostrum nesciunt et molestiae quas.	Lauriane_Casper	2020-09-22 19:21:12.331504
ab855635-c78d-4d1e-b324-3a6caf6ca562	cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Qui eius ut exercitationem nihil. Non itaque neque rerum quisquam alias est. Amet dolores vero est esse. Harum architecto rerum.	Sallie_Fisher	2020-09-22 19:21:12.331916
60a5ea1f-8b1d-4c9f-8fcf-ed53f4302811	782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Ullam illum beatae quae cupiditate ea sint unde aut. Ut cumque sed cumque. Tempora molestiae at occaecati.	Danyka_Osinski	2020-09-22 19:21:12.332571
303d8510-efaa-44af-9ba3-aea65b49188c	b711a645-0b1b-4f01-8c65-3508dffd92f3	Sit et cum. Quidem exercitationem blanditiis repellendus quo qui deserunt qui ab quis. Hic architecto quaerat enim est consequatur asperiores et quaerat consequatur. Omnis unde sunt. Beatae tempora amet unde possimus ea illo optio quia ipsum. Et officia itaque aut ut voluptas.	Lauriane_Casper	2020-09-22 19:21:12.334427
9350e2ee-f5ea-4bf2-93f9-e01cb84e1b73	3e7dfef9-b496-460c-a24a-9e90bc06c658	Eaque ullam odio. Incidunt minus velit vel facere at molestias et eos. Asperiores sed est dolorem quisquam odio eum dolor vel modi.	Elijah_Gulgowski59	2020-09-22 19:21:12.334841
e860a281-ff39-4d77-b2e3-365f4152d79a	adc2f6ed-a31e-43e4-9493-6a18866158d1	Recusandae aliquam laudantium quod illo. Deserunt quis nobis et dignissimos. Ut est ut aut. Qui natus itaque est omnis ut sed aut placeat nisi. Quis explicabo quo sit exercitationem ratione veniam esse debitis.	Lisette_Rodriguez	2020-09-22 19:21:12.336564
e80cb49d-074e-4c06-8c90-80cbd928b6ce	9ecd078c-de1f-40d0-9455-925e4c2c2213	Quo dicta saepe ipsum. Tempore autem reiciendis esse natus excepturi et.	Velva.Lebsack	2020-09-22 19:21:12.33748
910fdeea-1940-4198-8ae5-5f1fcb0b7237	fc65f17f-c071-4362-b9bd-4db4308da997	Nesciunt quae ullam fugiat et et autem quisquam tenetur. Est sunt earum est iure reiciendis. Eius odit exercitationem ipsa necessitatibus ea sed et vitae ea. Iste repellat reiciendis. Et delectus numquam ipsam repudiandae voluptas assumenda. Et rerum eveniet non maxime.	Gay34	2020-09-22 19:21:12.338336
72361df7-ad95-4ee8-85a2-222022867234	4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Omnis aliquid numquam tempore explicabo et. Ut minima qui aut. Est est in. Asperiores totam numquam vitae dolores at beatae voluptatem. Corrupti consectetur consequatur nobis non similique mollitia quia natus.	Pasquale_Considine	2020-09-22 19:21:12.338917
b341501b-d0de-4ec9-8cc8-7cfd2df628ae	ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Labore architecto occaecati sed. Quia deleniti iure.	Johan37	2020-09-22 19:21:12.368133
34c642d5-d0f0-46c6-9012-f072824a3de5	16a0b69d-3582-47c6-ba91-9c8d9d35202a	Sequi consequatur quae nam magni. Expedita reiciendis maiores dolorum dolor quisquam ea aut velit. Dignissimos iusto dolore blanditiis rerum.	Jarrett_Windler	2020-09-22 19:21:12.339752
850be028-89ec-4eb7-8073-b0ddecce001e	69199805-05c7-4301-8c05-868f29e606d6	Delectus architecto ad similique necessitatibus iusto adipisci et. Ab doloribus eius dolor culpa fugiat explicabo aliquam. Consequatur illo at at cupiditate est minus.	Lindsey38	2020-09-22 19:21:12.340688
437818d4-a64e-4f56-b92a-03bfb4338901	5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Aut enim quia in error. Nisi tempora incidunt qui sit rem deserunt omnis.	Althea.Crooks72	2020-09-22 19:21:12.341496
f4408278-4c56-4f36-bed0-4e5001f71f31	2508c094-ff79-4881-b756-74234df008f2	Molestiae quisquam impedit sed voluptas dolore aspernatur. Voluptas velit ipsum aperiam vitae qui non doloremque.	Domenico_Williamson8	2020-09-22 19:21:12.341941
998c6a06-a502-400f-8bb0-06e32b1f63b2	eb43e6c6-b016-445c-b33c-05468d203319	Molestiae veritatis natus qui earum quam illo et non. Esse et porro ut. Modi dolorem et repellendus velit. Et voluptatem at aliquam in nihil itaque reprehenderit est. Ipsam consequuntur recusandae maiores alias totam ea. Quaerat rerum sapiente non enim beatae qui cupiditate a porro.	Green23	2020-09-22 19:21:12.342366
ff322889-ba6a-459c-a6b9-94c63c79f7df	16a0b69d-3582-47c6-ba91-9c8d9d35202a	Cumque vel molestiae eum incidunt omnis. Harum odio ducimus numquam est. Dolorem doloremque expedita. Necessitatibus distinctio eaque ut esse consequatur.	Lisette_Rodriguez	2020-09-22 19:21:12.34368
b551b9f8-733d-418b-8dbb-2f9f2179792b	8592ac88-a537-40f3-b024-c5b90b11a69d	Voluptatum et aspernatur enim. Ea rem atque. Recusandae soluta quibusdam dolorum ut aut error quidem. Consequuntur maiores quasi quia architecto nesciunt dolor voluptatem delectus. Et molestiae est exercitationem ut nulla eveniet voluptatem. Ipsam omnis cupiditate unde perferendis eum.	Khalid.Barrows22	2020-09-22 19:21:12.344488
cdfb6cc0-6c3c-4652-a8c9-ba0c331ca54b	4889ed0c-8b6e-42b6-8a14-9819098eb223	Quaerat deleniti ut. Aperiam iure repellendus non deleniti dolores non accusantium. Voluptatibus repudiandae ut esse minima eius. Possimus soluta ea possimus accusantium quidem voluptatibus earum ipsa. Aperiam ex animi explicabo magni sed esse ea aspernatur.	Althea.Crooks72	2020-09-22 19:21:12.344878
348dbc96-e651-4bd9-9a86-46d0ac5dceda	e6030f49-4156-4c69-8aed-805cb4f8382a	Quo quaerat ipsa inventore. Consequatur ut quis quis aliquid et ut et eaque ipsa. Et sit sed harum. Ipsa architecto maxime et voluptatem voluptas minus.	Jarrett_Windler	2020-09-22 19:21:12.345287
070eaad1-fb80-4b2d-81e1-79b046482c1c	944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Beatae dolores porro. Reprehenderit non dolore natus et aut blanditiis qui. Esse itaque dolorum dicta.	Kamren55	2020-09-22 19:21:12.348689
632ef123-66b8-4d9a-91f8-f3ca65767cc0	f642ee24-7bc0-46e7-9f71-bd9668df40ac	Maxime itaque maiores porro unde aliquid tempora accusantium explicabo. Non rerum quia aut voluptatem et et. Consequatur id facilis ut et odit ex.	Eulalia.OConner	2020-09-22 19:21:12.349645
41b55d11-e388-48dc-8413-1b2e9711ce95	fa22a469-463b-44c5-b0f0-63a24be82fef	Commodi deleniti omnis. Fuga dolor deserunt autem dolor dolore dolore itaque.	Jolie19	2020-09-22 19:21:12.350057
7f137fff-599a-4c79-a670-6333606f5bb1	fa22a469-463b-44c5-b0f0-63a24be82fef	Unde at et. Doloremque vel sint eius odit beatae velit aliquam minima doloribus. Qui autem ab. Ut voluptates voluptatem. Aut aut quia in quidem non omnis eos repellat. Accusantium rem quia asperiores atque incidunt facilis nam atque nostrum.	Raphaelle17	2020-09-22 19:21:12.350495
f2fe39e3-a21e-4620-ae4e-73209c983e05	b711a645-0b1b-4f01-8c65-3508dffd92f3	Et debitis nihil natus tenetur harum nulla. Sunt eos a quaerat aspernatur. Enim quia soluta corrupti voluptas illo dolores libero accusantium error.	Eulalia.OConner	2020-09-22 19:21:12.350925
7b815528-1e99-42c9-b191-8eb6d1be80f4	596b6c27-1c6e-4870-83f6-3cef204cfc5e	Et voluptatum rerum qui. Et sed voluptatibus magnam et aut nemo quo. Aut sed consectetur est et.	Elsie_Rodriguez31	2020-09-22 19:21:12.352219
2aa880d1-5ad0-4232-8312-350a2e137f38	23c943e0-2ea7-42c7-9112-c77c08073122	Sint doloribus labore commodi soluta dicta doloribus placeat sed. Odit et consequatur sed autem quia magnam et. Et vero fugit aut a ex ut enim cupiditate. Et dolor voluptas blanditiis officia excepturi.	Khalid.Barrows22	2020-09-22 19:21:12.353162
74f9a16f-d879-4bbb-aad7-66c2e38fabb6	782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Ipsam asperiores aut incidunt libero eos. Neque ad qui ratione autem voluptatem. Id nesciunt laboriosam optio voluptate dolorum aut maiores quae asperiores. Ducimus hic hic et tempora. Quam odio eos natus laboriosam porro hic.	Mathew82	2020-09-22 19:21:12.354043
9d6dca10-9867-485b-9e5a-bc0921345751	9654831d-3c0e-4f29-b411-1111d5b059d2	Sed error nostrum magni in facere culpa sint ad illo. Velit illum ut reiciendis voluptatibus sit nesciunt voluptas quam dolorum. Labore fuga ut accusantium quasi vel repellendus fugiat ea nihil.	Dedric.Bartell	2020-09-22 19:21:12.354903
fa334b06-a449-413f-8a2b-aac7cf428a70	6e9d3106-eb15-4d80-9c08-c819a0189623	Nisi aut quaerat doloribus nostrum nostrum quas amet. Explicabo nulla minima neque quidem hic sit cumque omnis ut. Tempora vitae id beatae sit consequatur iste sunt repudiandae eveniet.	Stefan_Prosacco74	2020-09-22 19:21:12.357414
0df25fe9-d7c4-4f35-ae44-d7fabf6b0802	885df98a-8a7a-49d2-aba4-86d08b804cb4	Alias modi nihil architecto qui consequatur ut sit aperiam. Ipsam id corporis. Recusandae optio eos qui necessitatibus nihil ducimus delectus. Impedit quo laudantium doloribus adipisci quasi consectetur aut at et. Sunt aliquam est sit quia voluptatem aut.	Elta.Bernhard	2020-09-22 19:21:12.358258
eb10ec62-7df4-4cb4-a3ab-a518159727c7	596b6c27-1c6e-4870-83f6-3cef204cfc5e	Porro temporibus in sit iusto est et aliquam eos. Aliquam soluta quos maiores recusandae rerum velit animi repellat. Soluta nostrum magni dolor dolores facere asperiores amet rerum. Vero laboriosam maxime et dicta quis eaque quo officiis. Expedita autem accusantium et officiis voluptatem. Earum ea quia quasi ratione exercitationem.	Johathan16	2020-09-22 19:21:12.358682
93d3b35d-6b90-4e0d-8dfb-ecef706d3b5d	9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Aut suscipit consectetur velit doloribus et. Vel est tempore nihil sit esse et aut et. Est est tenetur rerum esse suscipit et voluptatum.	Rahsaan.Breitenberg	2020-09-22 19:21:12.359588
d21864c7-d04d-43c6-af55-3b31a5b9b6a3	fa22a469-463b-44c5-b0f0-63a24be82fef	Cum aut ad dicta impedit labore animi voluptas sint voluptas. Maxime quod cum. Quis quia qui illum consequuntur alias voluptas. Perspiciatis accusamus fugiat quidem saepe excepturi dolorem sint.	Miller.Yost54	2020-09-22 19:21:12.361285
4c5cf6eb-5801-4a4e-8a04-d759ab7466a4	2fd317ca-6aeb-401d-af6c-92bcce6f5943	Et maiores ut cupiditate. Et unde fugit placeat. Et dolore nostrum modi. Velit quia cum omnis. Adipisci ipsa sequi natus aliquam rerum magni eius.	Evans11	2020-09-22 19:21:12.361692
8711c59b-7296-4418-8e68-190e71ec905d	859aea6f-f0b3-4d5c-a417-efcab8d37363	Voluptatem cum voluptatem dolore alias corrupti omnis eum asperiores. Officiis aut sit ut. Minus porro earum ullam et sit aut.	Cristobal.Pfannerstill27	2020-09-22 19:21:12.362588
3791ff2b-7472-4f5f-8d71-88cd301bb173	adc2f6ed-a31e-43e4-9493-6a18866158d1	Eligendi occaecati voluptatem enim qui voluptatem. Et explicabo et enim corrupti repudiandae alias voluptatem. Nulla consequatur nemo. Asperiores ex omnis. Sunt non voluptate in numquam eum veniam.	Bridie.Kilback	2020-09-22 19:21:12.36346
4d20503a-4826-48e5-9440-a80c3419bb21	8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Qui error possimus molestias numquam quos sed ratione praesentium harum. Aut tenetur enim sunt sed facilis repellat harum.	Otho35	2020-09-22 19:21:12.363874
d1b2a2b0-80ae-4a8c-84b2-1b4930e4cbfa	8592ac88-a537-40f3-b024-c5b90b11a69d	Voluptas ea consequatur et est omnis eaque ab id. Voluptas numquam quibusdam non. Ullam omnis eum quidem omnis. Non perferendis reiciendis sed quisquam id dicta et dolores.	Kirsten.Reilly	2020-09-22 19:21:12.364705
6feb37d2-9571-4804-be45-3b1114e30fbf	6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Minus voluptate voluptates labore soluta velit illo. Magnam voluptas tempora aliquam et numquam veniam doloremque dolor voluptas. Esse quibusdam aut excepturi voluptatem similique odio. Quod ea maxime natus ut dolorum fugiat soluta. Illo repudiandae laudantium et. Voluptas non vel rerum quia.	Olin_Huels	2020-09-22 19:21:12.365126
19d394ba-e2e0-47da-ba08-0bdf8ea20d71	62978666-53c0-4edb-a671-19efd6e9457a	Cumque at ipsam at in iusto sint illo. Iste molestiae mollitia qui eaque cumque ea. Natus ut laboriosam reiciendis vel. Veritatis quia quam dolor fugiat quis. Ab ab quo at laboriosam est corporis dolorum ipsum.	Lonnie_Gleason	2020-09-22 19:21:12.366441
e521760b-6272-4341-b006-ae86610572c9	6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Omnis omnis quo non repudiandae. Qui ipsa ut eveniet. Alias itaque minima. Iusto rem ipsa est. Omnis sit doloremque. Quis sapiente molestiae eveniet sint voluptates sit aut.	Ursula_Mills	2020-09-22 19:21:12.367301
59873256-5a8a-451f-b39a-f595c1648d89	5d204e1d-c78d-45bc-9c8a-999656dcb32a	Vero soluta iste et ad. Qui deleniti deleniti ut voluptate ad totam. Repellat veniam earum.	Jean_Leffler	2020-09-22 19:21:12.368988
e6572dc6-7dd0-44a9-bc73-94d49dd0fde8	970eed6e-3a47-42a9-b90b-a3c049f96751	Consequatur tenetur non debitis laudantium quaerat quaerat eveniet pariatur placeat. Nulla aut voluptatem occaecati. Et tempora suscipit pariatur voluptatem voluptatibus. Tempore ut cupiditate velit quis. Debitis molestiae earum quis doloribus quibusdam velit ipsam. Possimus minus ipsum atque esse nulla.	Lauriane_Casper	2020-09-22 19:21:12.369458
999b8432-c6b6-430b-bc26-78d17f008b3e	cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Culpa et sapiente. Ea enim voluptatibus doloribus voluptas pariatur. Sunt eligendi ut doloremque. Nam repellat nesciunt ad esse repellendus dolorem minima at. Aut harum doloribus pariatur autem. Earum vitae numquam ratione nisi voluptatibus.	Joey.Tremblay67	2020-09-22 19:21:12.370369
1a8e2f58-3b59-4a93-ab1f-7e15ecc6fee6	4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Voluptatem deserunt voluptatem eius consequatur quibusdam. Odit excepturi cum aliquid quisquam officia nemo. Aut explicabo libero velit architecto quibusdam numquam voluptas rem. Consequatur numquam est dolor et autem laborum.	Vivianne.Jacobson	2020-09-22 19:21:12.372582
8b88aee2-e3ca-4d25-96a0-cc5b85ec24d4	58a21a0f-bcbd-4793-9917-e7ed67ee551a	Sit ratione dicta veritatis molestias consequatur voluptatibus harum dicta. Magnam nulla praesentium hic enim voluptatem vero voluptas consequatur. Velit eos consequatur omnis et sequi. Dolor et sed consequatur laborum quis magni molestias. Sunt qui dolores.	Khalid.Barrows22	2020-09-22 19:21:12.372986
93d27f71-f1c0-401a-b3da-e54120818f27	fc65f17f-c071-4362-b9bd-4db4308da997	Sunt aut reprehenderit sunt eos qui molestiae. Qui rem labore esse modi. Asperiores eius nemo amet molestiae repellat dolores. Delectus debitis sint aut architecto aut. Est dolorem voluptas laboriosam. Qui soluta et tenetur.	Angelita.Hammes	2020-09-22 19:21:12.37383
46bfe45d-e7e9-47fb-a2ab-6a488da95f82	62978666-53c0-4edb-a671-19efd6e9457a	Modi et praesentium voluptatem. Quod quam unde et eos suscipit. Necessitatibus sit ut quidem libero placeat rem neque et dignissimos. Maxime reiciendis aliquam qui. Recusandae ut et veniam quisquam aut.	Desmond_Hauck63	2020-09-22 19:21:12.375512
5a76f60e-6783-4be7-9bed-34065bf0af7c	16a0b69d-3582-47c6-ba91-9c8d9d35202a	Dolores dolor delectus ut est pariatur velit sit culpa molestias. Enim quasi beatae exercitationem quaerat ratione.	Elliott62	2020-09-22 19:21:12.376447
dda6b52a-7e0a-41be-a1c0-aed5d2010be7	885df98a-8a7a-49d2-aba4-86d08b804cb4	Perferendis asperiores necessitatibus quae est debitis repellat est. Voluptate molestiae architecto perferendis rerum asperiores sed. Inventore sit deleniti. Molestiae quo rerum nisi perferendis. Rerum omnis magnam non id.	Zoe.Hudson65	2020-09-22 19:21:12.376855
0c473333-baab-4633-b4c6-9b48d294e588	c8a81b45-cea1-4938-b2bd-5849fea7060d	Possimus possimus eos. Unde minus voluptas qui voluptate. Veniam illo at hic vero.	Chester97	2020-09-22 19:21:12.378122
bb212db6-47f8-4755-ba6f-224c5809e8f7	3e7dfef9-b496-460c-a24a-9e90bc06c658	Quisquam voluptas quas totam facilis consequatur et exercitationem. Qui dolorem nulla corrupti fugit possimus officia fugit eveniet necessitatibus. Rerum sit molestias maxime quia cum. Asperiores incidunt dolores. Quaerat ut est. Sapiente vitae vero voluptatem quam est esse autem.	Jolie19	2020-09-22 19:21:12.378986
328d6c40-2115-4652-89df-e425b9dfc805	8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Magnam iste sed eum saepe neque vel aut voluptate. Reprehenderit amet repellendus incidunt. Autem voluptatem eveniet voluptas velit in reiciendis beatae voluptas eius. Voluptatem dolorum nihil.	Reba_Maggio35	2020-09-22 19:21:12.379449
4cb45429-c127-4f41-987e-6ba92c54453f	6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Autem facere odio reiciendis aliquam rem quis. Id consequuntur voluptas corporis corrupti officia aut consectetur et. Est eos quidem totam hic officia sapiente quo fugit asperiores. Quas molestias qui recusandae voluptates dolore. Necessitatibus ad sed est consectetur nostrum suscipit.	Hector_Mraz33	2020-09-22 19:21:12.379874
0faadf02-b380-4d43-a385-d8d5fc21d470	b711a645-0b1b-4f01-8c65-3508dffd92f3	Cumque illum maxime sit minus repellendus sit animi sit. Nulla et molestias occaecati. Dolores ut facere ad sunt.	Zoe.Hudson65	2020-09-22 19:21:12.380282
1cb0572c-6810-41d8-85c3-f8ba9fa53021	782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Quisquam sed aut atque consequatur explicabo laboriosam id. Culpa nobis eveniet nostrum eius. Eius eum vel debitis accusantium ut iusto vitae quam. Maxime molestias quas vel aliquid deleniti praesentium quasi ex alias. Dolores quod autem occaecati.	Breana23	2020-09-22 19:21:12.380693
701de2d1-670a-4cc6-b438-05185d227a6a	b711a645-0b1b-4f01-8c65-3508dffd92f3	Iure maxime fugit quisquam sed eligendi. Aut sunt qui sunt quo nulla eligendi voluptates magnam. Nihil minus dolore iure qui ducimus voluptatem consequatur sit adipisci.	Mattie_Wiza	2020-09-22 19:21:12.382426
c7965e33-7027-4019-90c2-2d281e312640	5d204e1d-c78d-45bc-9c8a-999656dcb32a	Quidem adipisci odio voluptas consequuntur et eligendi. Repudiandae error consequatur quaerat exercitationem officia est non laborum fugit. Est molestiae ex ducimus et quaerat corporis et.	Glen_Krajcik13	2020-09-22 19:21:12.398144
2115dab5-38d9-45f6-8707-2a70de7e508d	944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Consequatur iste fuga et a occaecati perspiciatis ut fuga autem. Libero dolorem non veniam. At placeat ullam. Aut magnam et perferendis. Nam ab quo ea nesciunt molestias eum voluptatum.	Domenico_Williamson8	2020-09-22 19:21:12.383948
efb0748e-311e-4160-a38b-307b1882000e	532a613b-9be2-43e4-82f4-ddce03d99630	Nisi omnis et dolores non et eos impedit amet. Nobis alias velit provident. Quo beatae sunt quam a corporis vel. Quasi aut sit.	Aniya33	2020-09-22 19:21:12.384365
3271a4ae-22e4-4db0-bbba-d287a7da96b8	ee95e078-4299-4cb4-a596-d4348d73e21a	Sit eius illo magni debitis molestias similique. Laborum eveniet maiores. Quas esse numquam est dignissimos. Commodi alias enim id. Numquam sapiente iure enim a tenetur. Non amet quaerat recusandae qui placeat non nobis voluptatem.	Willa15	2020-09-22 19:21:12.38574
e8748222-bd8f-4aea-88bc-387fa5738e89	38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Vero fugiat laborum consequatur optio atque ut reiciendis. Quo ut enim quis accusantium ipsam.	Lisette_Rodriguez	2020-09-22 19:21:12.386211
5482a669-4814-411d-b357-2c8f538641d1	2508c094-ff79-4881-b756-74234df008f2	Voluptate libero iusto accusamus neque nesciunt. Facere non omnis aut blanditiis at omnis ipsam modi facilis. Dolores ipsam dolorum expedita veniam dolor quod qui omnis. Ducimus dolor excepturi minima et. Excepturi eaque commodi voluptatem similique voluptatem ut quae magnam ipsum. Aliquam vel distinctio doloremque et.	Callie.Rohan24	2020-09-22 19:21:12.38849
ac5271a8-2bc5-4b9f-90da-23b0bb141bf7	eb9c21ab-a064-4de9-921d-c059814f81c7	Est et voluptatem sed odio. Cumque sequi consequatur ipsa qui.	Danyka_Osinski	2020-09-22 19:21:12.389883
c1b47353-9eda-4385-9569-d89ce77c9186	16a0b69d-3582-47c6-ba91-9c8d9d35202a	Ut dolores corrupti aut rerum perspiciatis. Et et sed voluptatem omnis omnis tenetur sunt voluptates dolore.	Khalid.Barrows22	2020-09-22 19:21:12.390312
2957bf4a-a340-4923-b926-434a277649a4	859aea6f-f0b3-4d5c-a417-efcab8d37363	Magni quia distinctio beatae itaque qui doloremque quaerat harum. Rem ab animi.	Doris.Douglas71	2020-09-22 19:21:12.390733
8f93b317-d5a7-4e60-9f58-0bd1fc4516af	0d05f1aa-2f12-46f2-a0fa-86e72255635e	Dolorem aut enim maiores. Voluptatum non consequatur. Modi vel dolor. Et autem accusantium et. Est sint quis voluptatibus. Quis sapiente alias asperiores et.	Lottie.Kutch	2020-09-22 19:21:12.391157
d906d79e-0b23-465e-be49-6a391d535167	58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Ut nihil aut illo fugiat eligendi. Porro similique ratione facere sunt. Qui ut consequuntur et rerum eos ducimus atque.	Sarina58	2020-09-22 19:21:12.391578
0ceabaa0-4f71-434f-96fe-9c92d538a7f6	eb43e6c6-b016-445c-b33c-05468d203319	Non alias dolores exercitationem voluptate veniam. Autem perferendis consectetur qui minima accusamus.	Lindsey38	2020-09-22 19:21:12.392476
5eac735f-9a8d-481b-8e62-0e4975c8f926	6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Non nisi quae aut ad dignissimos debitis sit pariatur. Voluptas aut voluptatem exercitationem aliquam minus. Ut atque explicabo sit voluptas nisi rerum quae odit. Sunt aut accusamus omnis. Tempora inventore quia assumenda quibusdam quidem optio ut est voluptatem. Non amet rerum.	Mossie82	2020-09-22 19:21:12.393309
01e6327c-61fe-49a2-9a14-9d9f985fb46b	6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Est sed expedita eum sed tenetur iure itaque facere et. Qui accusamus esse autem quisquam eum rem sed saepe. Dolores rerum alias. Quis dolor quibusdam ea distinctio. Doloremque asperiores et numquam.	Otha.Willms	2020-09-22 19:21:12.395146
e6dd8704-6164-4aee-aa3b-8585a32586dd	96b2311c-d26f-4462-a29c-a94753161467	Voluptatibus explicabo nihil dolor velit earum velit est voluptatem. Et non assumenda quisquam voluptas. Dolore reprehenderit facilis praesentium tempora nostrum quae. Sunt at repellendus voluptates dolores tempora quaerat laborum. Mollitia voluptate et minus. Dolorem rerum iste consequatur.	Darwin45	2020-09-22 19:21:12.396422
d8b35438-1264-49c8-828c-de092d6e4f4d	6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Harum reprehenderit quos accusantium voluptas eum. Beatae porro voluptates necessitatibus. Officiis tenetur ratione dignissimos non corrupti est dolores quis. Quod magni consequatur.	Tiffany_Mueller45	2020-09-22 19:21:12.396838
5fb5644c-7f59-4c84-8289-992539d3a74f	4889ed0c-8b6e-42b6-8a14-9819098eb223	Qui in nulla et fuga deserunt. Eligendi minus aliquam possimus hic veniam aut. Non autem commodi ut soluta. Quis aliquid qui quo ab voluptatum qui. Vel eos quis sit non suscipit tempore minima eum.	Velva.Lebsack	2020-09-22 19:21:12.397721
aef6a852-ba51-49c6-9b99-22cd3e3d2cf2	218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Quia placeat eos ratione repellendus velit quaerat aspernatur ex qui. Dolorem animi aperiam quod nam veritatis iure omnis. Sunt aperiam sed illo doloribus sed veritatis quis. Magni ad et dolorem.	Darwin64	2020-09-22 19:21:12.399585
9d596b89-8ec1-4072-8d6b-705a6b4473cd	c9d6d7f8-eb89-4f85-8474-0767c578a03d	Magni dolorem nihil illo animi reprehenderit. Modi praesentium harum iure sed.	Mossie82	2020-09-22 19:21:12.400001
ccc7a1b2-5aac-4eac-b4fb-61c4bc7ecda0	c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Nulla repellendus sapiente dicta corrupti impedit repellat aut ex. Modi labore dolor non enim aut ut sed dolorum. Sit voluptatum suscipit soluta eum sit. Dolores non qui quia quam est quibusdam inventore autem.	Rhoda98	2020-09-22 19:21:12.402501
a596e552-7e75-4657-b8e2-cf313bb5fe2b	218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Et numquam quis cum aut minima nostrum. Eligendi sit repellendus quis unde fugiat quia eum.	Johan37	2020-09-22 19:21:12.402929
9d36fe24-b63f-4f38-8d63-bb8808e4f059	96b2311c-d26f-4462-a29c-a94753161467	Qui eos rerum earum occaecati eius sit. Velit itaque optio rerum cum aut occaecati ab maxime nemo. Non neque ut ut vel. Eius ut cumque eum. Quia voluptas vel ea. Placeat sed distinctio quisquam dolores qui.	Adelle38	2020-09-22 19:21:12.403336
d173ba03-da0e-406a-97d5-3e487721b828	d6295f45-ff33-4b75-9be1-c59902d1e9b8	Recusandae beatae eveniet vitae. Ipsum repellendus enim delectus nihil omnis quae magni sed. Dolore accusantium accusantium quia.	Shad_Prohaska	2020-09-22 19:21:12.403743
74e6ebac-1aad-49be-a57e-a556658136e4	4889ed0c-8b6e-42b6-8a14-9819098eb223	Non dolorem iste. Earum eos omnis repellat quis nihil. Repellendus id perspiciatis harum sit libero fugit dolores. Corporis beatae maxime similique et. A facere dolorem est quaerat qui expedita reprehenderit necessitatibus. Non est et commodi debitis accusantium nihil.	Nigel_Abbott	2020-09-22 19:21:12.404176
e797e818-b3c4-4d21-81dd-ea2b889d0904	970eed6e-3a47-42a9-b90b-a3c049f96751	Ut architecto consequatur alias ut. Praesentium aspernatur molestiae autem et et eius. Velit sed ab veniam. Sunt voluptate fugiat at quia voluptas amet autem consectetur. Nihil maxime ipsa ex quasi. Esse veniam et consectetur nihil.	Madalyn.Schinner	2020-09-22 19:21:12.404605
c9d74d82-66a6-48f1-b0fa-d7bde32e27eb	eb43e6c6-b016-445c-b33c-05468d203319	Exercitationem quidem ea consequatur voluptatem aut cum rerum. Repudiandae eum fuga deserunt quae eos commodi. Dolor perferendis quo sit ut. Nam nulla officia id suscipit in odit deserunt voluptate eaque.	Adelle38	2020-09-22 19:21:12.405031
175167fd-690d-4ba7-b288-6ac26ca8f9f4	020f3109-5d91-4cdc-936d-b60387e8f326	Rerum quis sit tempore voluptatem aut. Cupiditate accusantium sapiente quos molestiae et itaque. In et temporibus possimus quo quia occaecati quasi. Ratione veritatis veritatis quia error et labore. Dolor laborum iusto non ipsum accusamus ad omnis.	Naomie.Prosacco	2020-09-22 19:21:12.405498
c4e6ade3-1c66-45e0-baf9-dba56db2bb74	857d1eec-bb52-41be-8fe9-dcab56ef9113	Est perspiciatis corrupti deleniti. In vel facere.	Althea.Crooks72	2020-09-22 19:21:12.405973
2be6eee7-f4ca-4d7e-91f7-276d889c13ef	9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Quia est et quidem doloremque soluta ut nihil quo vitae. At impedit repudiandae sunt et perferendis quis sunt architecto. Eaque iste maxime officiis eos.	Korey1	2020-09-22 19:21:12.40729
364e2464-12d4-4c51-96e2-87a34d2f9acb	fc65f17f-c071-4362-b9bd-4db4308da997	Error voluptates et iste ducimus. Sint reiciendis harum nihil illum nisi quis nesciunt unde. Quidem nihil accusamus adipisci voluptas facilis repellat. Sit quas reprehenderit numquam voluptatum eligendi ipsum facilis eius illum.	Donna.Rutherford45	2020-09-22 19:21:12.407709
327deec1-3309-4f2d-8821-be4247b7be94	970eed6e-3a47-42a9-b90b-a3c049f96751	Reprehenderit et dolorum numquam excepturi qui iusto explicabo rem et. Dolore rem velit consequatur nemo nam modi blanditiis libero et. Autem recusandae consequatur dignissimos nisi corporis earum earum. Laboriosam numquam ipsum ex accusantium reiciendis molestiae dolores. Earum ducimus omnis atque repudiandae. Aut illo qui rerum vero aliquid non.	Stefan_Prosacco74	2020-09-22 19:21:12.408147
062f4476-4821-4db0-8467-6659a483e1cc	ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Dolorum animi nemo illum. Eos ad in velit nam ut voluptatem ad ratione. Sint minima blanditiis similique cupiditate eos et debitis. Ea aut aut. Aut ad voluptas.	Golden_Raynor	2020-09-22 19:21:12.408583
d763636d-d90b-4a82-a430-9aa273c90e30	532a613b-9be2-43e4-82f4-ddce03d99630	Aliquid aliquam perferendis enim ratione velit aperiam eveniet adipisci ea. Animi asperiores dolores quis consequatur officia ad ut. Non perferendis error eum amet itaque. Omnis harum dolor vel beatae. Magni amet dignissimos veniam perferendis eius quia et rerum.	Melyssa_Halvorson	2020-09-22 19:21:12.408996
0bd3b98a-34e9-4243-889c-65f4297ca0b8	ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Id neque dolorem modi maxime. Harum dicta voluptates facilis sit recusandae dolor. Qui reprehenderit nemo rerum non consectetur sed quasi. Numquam cumque in porro velit numquam est velit sed. Ad expedita sit.	Sven97	2020-09-22 19:21:12.409477
9b5a324b-9b3a-42a5-b236-2fc585e0bdbe	16a0b69d-3582-47c6-ba91-9c8d9d35202a	Tempora voluptatem fugit ad ut odio. Facilis eligendi officia aut voluptatum iste et. Molestiae quia et ea sed aliquid vel unde consectetur. Qui dolores hic voluptatibus eius odio natus nihil nobis quo. Et nam praesentium autem est id quod cupiditate ut velit. Fuga sint fugiat ut quia blanditiis.	Crystal_Balistreri	2020-09-22 19:21:12.410296
a21dc457-4c29-46a4-a215-07a386243090	8517aab1-684c-4f3c-bf4d-af4df17e511e	Laboriosam eligendi cum consequatur est qui fuga corporis quasi officiis. Odio rerum officia sapiente et. Ratione est non impedit. Laudantium laborum dicta enim sint vel. Explicabo aut blanditiis voluptas odio fugit. Facilis quisquam quos.	Veronica.Satterfield42	2020-09-22 19:21:12.410714
c5ed67c8-2192-40ac-8334-a38c58eca328	fa22a469-463b-44c5-b0f0-63a24be82fef	Ut explicabo eum adipisci architecto sed harum porro et quis. Dolorem sed earum. Deleniti rem excepturi dolorum rerum.	Morgan_Borer	2020-09-22 19:21:12.411141
52b9af62-c2b2-449a-8b13-1228d5059e8b	3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Earum enim beatae quibusdam facilis. Pariatur nobis atque eum dolorum vero ex ut quia aut.	Velda.OReilly24	2020-09-22 19:21:12.412016
2e650e4c-b7d7-46e1-b648-a5e18b043ce7	d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Adipisci quia earum et quidem magni repellendus est veniam fuga. Aut voluptas vero alias temporibus nemo commodi rerum eos.	Edward_OReilly	2020-09-22 19:21:12.41245
60887357-80f0-4296-ba91-6548265d352b	108e57ac-5c11-47db-a106-fc3963f7b58d	Magnam exercitationem animi illum reiciendis nihil dolorem et ducimus. Quam cum ut animi rem veritatis quasi maiores. Beatae est eum suscipit dolorem itaque enim sapiente qui ut. Ex officiis distinctio dolorem qui. Eius blanditiis at dolorem ut distinctio voluptatem. Repellendus provident et dolorem praesentium sint voluptas.	Vivianne.Jacobson	2020-09-22 19:21:12.412964
abbd7e49-2f7a-43a5-ac66-1adbfd29212d	8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Et et est est aut. Facere explicabo unde sunt animi sequi quaerat. Alias eveniet sed aut atque tempore dolor fugiat vero.	Chester97	2020-09-22 19:21:12.413396
3e0fc674-be8b-4267-ab9b-a4b172f9cd3c	60d195d0-3674-4b1e-b907-553b0d57d8be	Nihil numquam rerum quia est corrupti voluptatem placeat et inventore. Voluptates repellat possimus rerum doloribus quidem in odio ut quos. Eos et odio. Nam rerum eum deleniti eius. Et est quia ducimus dolores ea sed consequatur ut tempora. Neque neque animi quia qui voluptates quisquam temporibus nihil.	Angelita.Hammes	2020-09-22 19:21:12.414215
3a4c7c3b-37ea-468f-974b-6935a4564d2d	c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Non id libero quae ipsum nostrum perferendis odio nemo. Rerum quas accusantium eos voluptates quae doloribus. Tempore et ea expedita. Illo et aliquid consequuntur est sint. Dicta dolores asperiores provident cumque vel nam modi. Quo sit consequatur ipsum corporis ipsum dolorem ut ipsa.	Jazlyn.Beier5	2020-09-22 19:21:12.414651
a239a1a5-1c0b-4d96-82b9-f668aa4ee511	9654831d-3c0e-4f29-b411-1111d5b059d2	Minima qui tempore aut voluptatibus consequatur ad ipsa reiciendis nihil. Et temporibus reprehenderit autem dolore aspernatur eos. Molestiae in vitae blanditiis.	Waino.Reilly9	2020-09-22 19:21:12.415526
19f0f08c-6dcb-4173-bd4f-2ca2ad68d42c	fc65f17f-c071-4362-b9bd-4db4308da997	Eum quos non. Ea ut sunt. Et laborum esse quae quam debitis sint consequuntur totam perspiciatis. Atque iste alias qui temporibus possimus quae et.	Madalyn.Schinner	2020-09-22 19:21:12.41595
5cd212ec-d32d-48fc-8e40-55a34859ae0a	6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Rem praesentium placeat quaerat at. Odio non et ut dolor modi sequi non odit. Illum dolores ducimus error alias cumque. Repellat at veritatis eum fuga numquam est. Praesentium asperiores voluptas. Corporis accusamus qui error esse tempora incidunt libero.	Jalen_Yost	2020-09-22 19:21:12.417222
7a129025-7cd1-4b77-ab02-d9a6095b1a05	532a613b-9be2-43e4-82f4-ddce03d99630	Qui incidunt aut qui est autem natus. Nihil laborum nulla voluptates provident non error inventore fugit. Natus quia minus. Ratione non ut sunt porro cupiditate maiores nulla.	Orlando43	2020-09-22 19:21:12.418076
7ec8cf88-8238-45aa-b2bb-8bbc85e14185	3e7dfef9-b496-460c-a24a-9e90bc06c658	Inventore in quidem eveniet esse illo porro accusamus harum ut. Et quia sed quasi.	Eulalia.OConner	2020-09-22 19:21:12.418478
1226979c-5344-40a6-9d12-75d1973b8051	59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Numquam dolores laborum tempore inventore id accusamus perspiciatis. Natus facilis eum dolor eos tempore officiis cum et in.	Darwin64	2020-09-22 19:21:12.42022
b90273c6-5456-4d31-8d9a-66342b4cd770	9ecd078c-de1f-40d0-9455-925e4c2c2213	Quo consequatur reiciendis ut aut quia quidem a nihil. Sunt amet aspernatur ipsum aliquid architecto deleniti. Laudantium qui sapiente est recusandae ut laboriosam sit. Magni iste in rerum.	Aniya33	2020-09-22 19:21:12.420641
b0d7e48d-a104-46d4-8b85-60576dd495e8	c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Voluptatem alias id ad quia consectetur praesentium. Voluptas atque tempore voluptas in autem enim sed excepturi aut. Id dolorem sit earum. Laudantium impedit odio voluptatem repudiandae.	Edward_OReilly	2020-09-22 19:21:12.421478
56a3d045-c13f-4b63-97bd-c3d891d5b4d1	3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Blanditiis aperiam magnam. Repudiandae voluptatum laboriosam beatae. Modi totam esse sed nam perferendis dolorum. Quidem quos nam.	Chelsey16	2020-09-22 19:21:12.42277
6740e847-568f-436f-ba05-2559c374b908	0d05f1aa-2f12-46f2-a0fa-86e72255635e	Quasi quibusdam asperiores eaque perspiciatis. Eos aut alias. Similique sit quis debitis officia consequatur dolore voluptas praesentium. Ad qui quis et sit provident neque corporis libero nesciunt. Voluptates aliquid ut voluptatum.	Jarrett_Windler	2020-09-22 19:21:12.423208
b3b5bb4a-878f-41fd-a607-8a297c95d7cf	1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Magni voluptatibus amet quidem deserunt harum cupiditate. Reiciendis nihil iste dolores voluptatem cum quam omnis.	Angelita.Hammes	2020-09-22 19:21:12.424123
656ec7f3-c358-4313-aa67-e51534115976	b711a645-0b1b-4f01-8c65-3508dffd92f3	Et aut est. Praesentium reiciendis totam assumenda voluptate.	Althea.Crooks72	2020-09-22 19:21:12.425055
0f76f72b-947e-4f3b-bf27-12eaab8d494a	9ecd078c-de1f-40d0-9455-925e4c2c2213	Similique nihil autem. Illum inventore accusantium sit. Nihil ut a fugiat sapiente eaque. Aut sit qui hic similique eum sunt incidunt.	Stefan_Prosacco74	2020-09-22 19:21:12.425976
7acd8631-7751-4ba4-b8db-10bc6d0eb47d	d6295f45-ff33-4b75-9be1-c59902d1e9b8	Est quia commodi aut excepturi hic sint harum. Ab nihil aut sit. Et sint libero voluptatum odit. Ipsum quasi placeat id sunt in qui earum.	Otha.Willms	2020-09-22 19:21:12.42639
98417e39-65d9-4270-831f-c73d7c4820f8	b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Aliquid maxime molestiae qui. Occaecati consequuntur voluptatum quas. Et recusandae quam. Enim sunt quae excepturi quisquam veritatis et atque. Dolores minus quibusdam unde.	Gay34	2020-09-22 19:21:12.427232
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.posts (id, title, author, body, created_at) FROM stdin;
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	tpy1	routePY	bpy1	2020-09-14 14:05:19.906909
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	tp2	routePY	bp2	2020-09-14 14:05:19.91305
c000d026-2e11-4d5d-b4aa-c533bf769016	tp3	routePY	bp3	2020-09-14 14:05:19.914749
028edee6-e5dd-4c87-83f8-30e3ea11d690	tp1	routeP1	bp1	2020-09-14 14:05:20.150436
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	A totally Innovative New App Idea	fish_guy	It's never been thought of before: An app that writes apps that write apps.	2020-09-15 17:41:27.7817
9f20d789-935c-4109-b05a-3077a29eb1df	An Idea With a Lot of Paragraphs	fish_guy	Vestibulum lacinia non tortor vel tempus. Praesent tristique elit efficitur fermentum laoreet. Fusce quis mauris nec tellus consequat pretium. Aliquam viverra purus sed nulla volutpat mattis. Praesent non libero nunc. Curabitur ut tempor lacus, ut feugiat massa. Sed gravida lorem et lacus volutpat aliquet. In hac habitasse platea dictumst. Phasellus ullamcorper, ante sed rhoncus accumsan, ligula nisi elementum tortor, ac blandit ex ipsum elementum nisl. Aliquam vulputate tristique enim, sit amet condimentum magna vulputate sed. Cras aliquam metus sit amet elit elementum, vel hendrerit libero commodo. Morbi at sapien velit. Donec facilisis orci et ipsum posuere, eget dapibus nibh varius. Phasellus vitae nisi vitae ipsum iaculis hendrerit ut nec leo.\n\nVivamus vitae tortor cursus, cursus mi eu, dictum nulla. Pellentesque bibendum eget odio id sodales. Duis porttitor elit sit amet odio fringilla tempor. Donec bibendum vestibulum euismod. Maecenas lorem neque, commodo sed dolor sit amet, hendrerit aliquet sem. Praesent arcu leo, mattis blandit odio ac, finibus tempus justo. Ut cursus lorem non sagittis lobortis. Sed lacus nulla, consequat in lacinia a, efficitur a libero. Duis dictum tristique feugiat. Maecenas posuere euismod nisl, in molestie lectus bibendum a. Ut semper, est ac imperdiet mollis, ligula arcu congue lectus, eget laoreet diam lorem at nibh. Cras vitae congue nisi. Vivamus nec metus at ligula finibus lobortis.\n\nAenean faucibus eget orci vel tempus. Nulla ut eros magna. In hac habitasse platea dictumst. Maecenas non rhoncus augue. Curabitur at orci sit amet orci malesuada aliquam. Phasellus efficitur vehicula enim, a lacinia risus imperdiet at. Mauris aliquet sed sapien viverra feugiat. Ut scelerisque libero et libero auctor, id pulvinar felis finibus. Aenean et elit eget enim finibus aliquet sed id arcu. Vivamus pellentesque, ipsum quis suscipit tempor, justo massa aliquam sem, id tempor sapien diam at enim. Curabitur sed tempor metus. Maecenas aliquet maximus porttitor. Morbi nec lectus ligula.	2020-09-16 14:07:00.216106
33661f21-e0a0-44b4-8ee1-5069de617cd6	an updated title	chicken_guy	a sensible body	2020-09-20 12:52:16.945736
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	enhance 24/365 technologies	Karley.Klocko63	Totam voluptate est quos consequatur numquam ipsa blanditiis odio. Mollitia aut blanditiis minima rerum harum ea. Neque nobis voluptate quia at et ut. Reprehenderit aliquam omnis harum blanditiis autem.\n \rNostrum culpa voluptatibus qui expedita ut eos. Tempora sunt est vero eligendi id nam voluptatem quod. Hic nam amet dolorum. Et minus aut in et est. Laudantium modi nesciunt adipisci a cum qui.\n \rVoluptates ipsam possimus. Quis omnis mollitia exercitationem unde fugiat non. Magnam eaque sint omnis accusantium omnis iure. Quis et labore aut est at inventore.	2020-09-22 19:15:03.104406
70b771dc-531b-40ae-b0d0-129c3585a0e6	optimize vertical methodologies	Karley.Klocko63	Dolorem nobis nostrum unde dolorem veniam. Facere quae illo eius neque. Quas inventore provident nobis assumenda voluptatem nihil. Voluptas fuga molestiae eveniet corporis.\n \rSapiente aut perferendis sed. Enim doloremque tempora dolore. Et sit eos non sint rem aut distinctio. Cupiditate sit deleniti doloribus eum quia voluptatem.\n \rAccusantium accusamus aut sunt fugiat et non. Aperiam non illum. Dolor blanditiis excepturi voluptate. Ut incidunt asperiores qui est expedita quis et velit. Perferendis esse perferendis aspernatur vel. Deleniti quis molestias quia nisi.	2020-09-22 19:15:03.112938
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	mesh revolutionary technologies	Carlee.Runolfsson	Voluptatem nostrum qui occaecati. Quis est vero modi molestiae occaecati et nam sit. Dolores molestiae ipsam distinctio iure doloribus ad dignissimos. Facere commodi eaque. Maiores consequatur corporis voluptatem voluptatem recusandae ut et. Officiis nam ratione eum ex ut tempora.\n \rEum sed omnis corporis harum eos et reiciendis. Placeat aut sed eos adipisci. Odio excepturi repellat ex. Veritatis eum quaerat delectus.\n \rEsse cum molestiae quidem dolores aut natus est aspernatur aut. Voluptas omnis assumenda necessitatibus voluptatem inventore alias. Ipsa modi illum fugit voluptas amet qui.	2020-09-22 19:15:03.113682
fd11ea42-00f3-42bd-8eef-92920baad2aa	matrix innovative functionalities	Karley.Klocko63	Ullam ducimus placeat eum a amet adipisci consequatur ea. Est corporis molestias saepe autem officiis et cumque possimus qui. Dolorem error in dignissimos autem eaque esse ipsa. Nam non velit adipisci quis et delectus culpa rerum. Incidunt recusandae deleniti pariatur reiciendis quidem.\n \rAssumenda nostrum aspernatur dicta ad nam modi. Ut animi eos. Repellendus in officiis architecto consequuntur velit occaecati earum. Aut vel quos fugiat corporis et aperiam ad. Ad dicta possimus voluptatem fugiat hic iure recusandae vero aperiam.\n \rEaque earum ut tempora blanditiis modi enim iure. Tempore reiciendis voluptatem optio fugiat et possimus officia eum. Sapiente optio iste sint eum natus quia. Quaerat qui ea laboriosam animi deserunt.	2020-09-22 19:15:03.115063
986856b1-ca8e-4b88-8129-0aaf194d4e7d	synthesize one-to-one e-tailers	Carlee.Runolfsson	Amet aut corrupti magnam qui amet quas. Consectetur voluptas ut aliquam quae eveniet praesentium ipsum fuga placeat. Molestiae esse quos minus. Incidunt et dolores sequi incidunt. Nobis eligendi error debitis. Dolorem provident velit quaerat.\n \rEaque impedit voluptas assumenda corrupti id aut consectetur. Eligendi quas minus quas repudiandae est voluptatem ab tempore quidem. Sint quis a natus. Placeat ex ab aliquam repellat est vitae enim inventore.\n \rFacere rem at. Rerum harum vitae natus quia cumque unde voluptate ut voluptas. Reprehenderit maxime cumque saepe. Rerum minima enim aut deserunt. Nostrum saepe ipsam a qui asperiores voluptate rerum aliquid omnis.	2020-09-22 19:15:03.115779
ad3a12c2-8f46-41b9-b076-6f25cb81903e	harness bricks-and-clicks infomediaries	Rosalia.Aufderhar57	In sapiente et dignissimos ut quo nobis debitis dignissimos aut. Sit cupiditate voluptatem reprehenderit debitis. Qui inventore earum. Voluptas sint porro animi officiis. Possimus corrupti saepe omnis.\n \rReprehenderit dolores quia maxime consequatur quisquam nemo et. Doloremque asperiores quis ipsam quo aliquam nostrum. Odit quam nostrum adipisci numquam ad qui. Quas consectetur consectetur. Neque quis tenetur tenetur hic ut.\n \rOfficia quam et enim maiores. Illum ipsam quae sapiente omnis repellat qui enim. Esse qui eum repellendus sint. Officia est sequi est. Atque et dolor illum.	2020-09-22 19:15:03.116515
1068352b-6b6a-43bd-ac5c-3642fa872bfa	envisioneer scalable communities	Carlee.Runolfsson	Ducimus perspiciatis delectus dolores est modi voluptatem at. Corrupti tempora perspiciatis magnam fuga maiores fugit praesentium. Pariatur dolorem mollitia iusto et amet ut facilis explicabo. Quia ex magni et et veritatis. Ipsa qui distinctio exercitationem in quibusdam quo ipsam. Dolor laudantium voluptates tempora maiores distinctio.\n \rImpedit atque architecto blanditiis atque enim iste aut doloribus atque. Neque qui dolor quia. Enim eius a. Aut voluptate in consequatur a tempore. Id deserunt maiores quasi iusto ab ullam neque exercitationem aut. Cumque et vel debitis quia qui dolorem.\n \rModi modi saepe enim. Aut facere ut est quibusdam ea harum ullam quibusdam a. Saepe asperiores sed dolor et. Quibusdam enim consequuntur enim dolor. Aliquid at quam fugit vel est voluptas. Inventore omnis unde repellendus nihil esse cupiditate voluptatem sunt ipsum.	2020-09-22 19:15:03.117245
36858a27-3c56-46c8-af27-984828aebb98	grow leading-edge models	Eino_Hayes46	Aut vel ut doloribus quia quibusdam sed aperiam beatae quibusdam. Quis asperiores natus sunt omnis. Et et iure iure quia optio nihil laboriosam dolorum voluptas. Et voluptates dolore vitae culpa repellat consequatur perferendis placeat. Eos id ab et illum dolorem omnis quasi in sunt. Maxime ut esse expedita deserunt eveniet quas alias odio.\n \rEnim aut natus dicta. Ut modi aut veniam aut. Corrupti repellat odit sapiente eius qui voluptatibus cumque. Placeat provident iusto asperiores sequi at vitae. Iusto ut aut voluptas qui eum facilis eos in doloribus. Voluptas quas animi.\n \rOccaecati aperiam quod mollitia minima beatae vel ipsum rerum. Earum quasi hic delectus. Reiciendis laborum fuga sequi.	2020-09-22 19:15:03.119752
11e8b6e2-72d7-4f24-8b64-e195c0117f31	morph clicks-and-mortar e-tailers	Rosalia.Aufderhar57	Possimus aut ea ducimus rerum optio voluptas et repellendus. Cumque quia atque necessitatibus recusandae possimus aut. Cum dolor est ipsam consequatur dolorum.\n \rReiciendis dolores ratione. Cupiditate ut nulla non deserunt repellat earum minus voluptatem. Non occaecati excepturi necessitatibus necessitatibus omnis. Quis ut quo dolore eveniet est neque quas. Eos qui deserunt dolorem ducimus cum harum.\n \rSunt ratione id repellendus nostrum qui. Ratione dolores repudiandae dolorum dolorem occaecati animi. Facilis quidem sed sit. Distinctio nesciunt provident deleniti et exercitationem. Quidem quae nam.	2020-09-22 19:15:03.121163
1d5c2502-ca57-4203-9271-bd342aca5648	productize collaborative experiences	Carlee.Runolfsson	Et provident labore non hic minus iusto illo a ipsum. Numquam doloribus repellat quia quo itaque id sed placeat. Sit animi quod commodi officia. Veniam velit sapiente sunt sit distinctio est doloribus.\n \rDoloremque soluta atque impedit earum voluptatem. Cum eos consequuntur nihil debitis dolor consequatur eum tenetur. Aut dolores nostrum.\n \rExpedita in et quasi eveniet molestias at suscipit aut omnis. Amet quisquam qui consequatur exercitationem commodi nihil reiciendis. Quasi et sapiente quod reiciendis quam dolores sint. Ipsam temporibus et illum asperiores officiis explicabo suscipit quos et. Vitae sed consequatur sequi similique magnam quibusdam. Illo dicta ex aut cumque tenetur explicabo delectus.	2020-09-22 19:15:03.122497
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	harness scalable partnerships	Maverick63	Velit nostrum enim ipsum reiciendis fuga ducimus facere. Hic voluptatem consectetur quo a minus soluta. Quis minus earum qui officiis aut nemo sit qui aut.\n \rEum sit ipsa. Assumenda repellat officiis repellendus aliquid est aut culpa nihil. Ut sunt autem similique. Earum rem deleniti omnis.\n \rNam laudantium qui veniam accusantium provident. Culpa est quidem voluptatem magnam sint. Qui amet sunt enim. Corrupti officia omnis quis numquam praesentium dolore. Magni consectetur optio placeat. Voluptatem veniam est qui ipsum sed cumque at qui.	2020-09-22 19:15:03.124329
99e91398-36df-496e-b4aa-97b6d77cbab1	strategize bricks-and-clicks architectures	Wilford_Hand	Labore aut reprehenderit doloribus odio voluptatem cumque possimus laboriosam aut. Molestias aut laboriosam. Unde qui fugiat ratione mollitia alias veniam ea et.\n \rEt aliquid non. Iste accusantium impedit voluptates recusandae asperiores beatae. Perferendis beatae corrupti modi.\n \rIn voluptatum quisquam. Dolores qui quibusdam libero repellat recusandae. Aliquid explicabo sit voluptatem sint quasi officiis eveniet tempora voluptas. Nostrum reiciendis aut sed.	2020-09-22 19:15:03.124984
c02a050c-9299-4313-b24d-d42a6c189505	optimize world-class networks	Carlee.Runolfsson	Possimus inventore quos maiores qui temporibus. Quae vel aliquam maiores aut nobis minus qui voluptas. Nobis repellendus est voluptatem aperiam minus eum qui et.\n \rVoluptatum quos ut est magnam harum labore. Est rerum quo occaecati quis laboriosam. Reprehenderit sunt vitae fugit et voluptatem possimus et.\n \rNon deserunt rerum non voluptate et. Ab hic quis inventore aut voluptate. Eos aut non voluptatem dolorem atque ratione. Eveniet eius assumenda quos deserunt magnam necessitatibus nobis iusto omnis.	2020-09-22 19:15:03.126335
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	evolve B2C functionalities	Oren47	Eius similique doloremque voluptates omnis vel maxime. Aspernatur soluta officia magnam. Possimus quia esse. Rerum corporis impedit repellendus aliquid deleniti dolorem necessitatibus in eos.\n \rQuis neque placeat quos sequi et velit ipsum quasi excepturi. Quia ut officiis iste. Consequatur occaecati ut fuga iure autem. Molestiae et quo facere.\n \rEt magni qui quam molestias ut culpa eaque occaecati. Ut voluptate quidem totam quia consequatur. Ea eaque qui inventore voluptates eaque neque.	2020-09-22 19:15:39.119242
cb2730fa-9028-467f-905d-75c229ed9879	harness sexy systems	Sibyl17	Aut harum sunt doloribus reprehenderit. Eum aut eos tempore molestiae dignissimos. Necessitatibus earum dolore. Voluptatem dolore omnis voluptatum et eos perspiciatis. Ut sit repellendus facere ipsum.\n \rMolestias molestiae dolores nisi ad dolore sunt. Aut qui officia ut aut. Atque ipsam consectetur repellat voluptatum.\n \rExplicabo sit nostrum. Voluptas non ut et alias et corporis eligendi sit sed. Consectetur provident praesentium quidem eius dolor nulla ut.	2020-09-22 19:15:39.120955
3221ada1-66fb-45ff-992f-bd915d8a8a78	benchmark collaborative platforms	Sibyl17	Nostrum et doloribus facere omnis. Nihil porro accusamus deserunt eum molestiae fuga. Earum sapiente recusandae nulla facilis. Doloribus numquam laborum dolor reiciendis vitae sunt asperiores.\n \rRecusandae placeat ad ad qui vel aut est natus. Quo quisquam in sit temporibus doloremque quod qui. Laboriosam voluptatem et error laboriosam soluta est. At inventore ipsam minus qui reprehenderit occaecati dolorem. Et incidunt laborum molestias eos et.\n \rSequi animi deleniti distinctio non officia quis consequuntur recusandae. Corporis nobis et. Officiis voluptate dignissimos a fugiat accusamus est. Quo est blanditiis quasi accusantium.	2020-09-22 19:15:39.122453
71987b86-bbec-457b-a2d9-c1b3257dd876	evolve visionary models	Oren47	Sint sint qui. Sit tempora odio non consequuntur et ea. Quis provident velit excepturi enim.\n \rNisi occaecati quo illo modi voluptatem ut et voluptas. Ut quibusdam tenetur. Ut earum sit deserunt repudiandae voluptatem laudantium expedita fugiat suscipit. Quasi repellat ducimus expedita aut. Voluptas unde molestiae nesciunt omnis alias earum omnis enim. Quia ducimus rerum eaque cum qui unde corporis consequatur.\n \rFuga consequatur commodi voluptatem ratione et aut. Recusandae omnis sunt et. Aut nobis blanditiis et consequuntur cupiditate.	2020-09-22 19:15:39.123892
b49a1b48-c5eb-481a-a8dd-97188965a26d	deploy wireless mindshare	Leann42	Est alias nobis distinctio ea. Sint facilis sit magni aspernatur placeat libero. Qui doloribus ex ea quod adipisci autem itaque nulla. Mollitia numquam sit debitis ipsam. Distinctio deserunt corrupti occaecati iusto cumque voluptates numquam unde.\n \rAspernatur omnis autem laborum commodi. Aspernatur ducimus nam aspernatur qui error ad. Ullam voluptatum iste consequatur qui error. Qui sint non molestiae non impedit omnis expedita quia rerum. Numquam autem quibusdam qui voluptatem.\n \rVoluptas quo vel velit totam eum quos eaque pariatur ipsam. Animi itaque repellendus. Numquam quia aperiam sapiente tempora non est. Labore vitae expedita rem sequi sunt beatae alias. Enim placeat qui earum et corrupti molestiae labore ut qui. Autem doloremque provident eum.	2020-09-22 19:15:39.126367
bf75a830-7874-44ca-ab46-275c273b4c76	morph compelling e-commerce	Gail71	Quaerat ullam maiores et odit minus quis odio similique sint. Modi et error odio iusto aliquam autem vitae nulla. Vel et eum aperiam voluptates.\n \rId omnis possimus odio voluptate fugiat iusto neque. Deleniti eos dolorum et. Esse veritatis ratione. Non consequatur voluptatem eaque.\n \rNesciunt ea ipsa at modi id tempore ipsa tenetur sunt. Magni suscipit rerum vel numquam et dolorem facilis. Explicabo quasi et reiciendis velit asperiores enim reiciendis quod porro. Velit hic dicta at molestias qui.	2020-09-22 19:15:39.127028
98d76875-65d1-403b-9f65-e1b77fb25903	redefine cutting-edge users	Fritz.Keebler	Saepe voluptatem ut. Est nihil suscipit repudiandae earum. Harum repellat asperiores inventore quidem impedit dicta. At est quod laboriosam officiis qui sunt non officiis.\n \rOptio voluptas magni rem voluptatibus quidem non laboriosam. Vel accusantium beatae natus. Ex voluptas quos.\n \rQuis accusamus enim exercitationem reiciendis. Sequi delectus numquam fuga. Reiciendis provident porro rerum necessitatibus temporibus dignissimos quasi dolor non.	2020-09-22 19:21:12.234151
5a680d3b-55c9-46c1-9b3e-1bacba315b11	integrate real-time e-tailers	Oren47	Aut at qui dicta sunt voluptatem. Animi quae omnis veniam ut dicta. Voluptas et iste voluptas sit consectetur doloribus minus quasi. Nulla omnis ab expedita dolorem ut et ad facilis. Id rerum dolore cupiditate eveniet qui assumenda et architecto veniam.\n \rEum voluptatem et repellendus eaque officia velit beatae neque alias. Praesentium suscipit qui assumenda. Corporis sapiente tenetur deserunt repellat neque similique quae earum qui. Explicabo dicta ea aut quam.\n \rVoluptatem optio sed est et quia rerum dolore. Laudantium est autem cum quia voluptas. In dolorem quis deserunt recusandae. Molestias exercitationem nisi atque totam magni.	2020-09-22 19:15:39.127676
d6432e5e-3724-48bf-b8b0-8f5f959888ea	iterate one-to-one schemas	Sibyl17	Pariatur voluptatem ad quo odit sint et blanditiis quos. Et vel assumenda non minus. Delectus minus nostrum porro vitae aut numquam ipsam sunt a. Illum voluptatem repellendus tempora tempore. Voluptatem officia ducimus fugiat aut quaerat ea qui.\n \rQuasi non voluptas ipsum magnam quia at aut et ut. Sit aliquid nostrum aut. Ut fuga non quis dolores tempora fugit provident.\n \rNostrum eligendi consectetur fugit est temporibus modi. Dolor esse saepe quaerat error sunt odit porro sapiente et. Quae ut quia assumenda laboriosam id facere rerum eum. Error modi in quia. Voluptate non dolorem sint impedit enim hic dolorem qui numquam. Quasi ad quae error velit iure eos quia quia occaecati.	2020-09-22 19:15:39.12853
a78acc11-6874-4bff-96d4-29ae7974a05c	syndicate viral paradigms	Sibyl17	Sed rerum dolor fuga maxime. Est hic et fugiat consequatur commodi omnis. Beatae quas molestias. Sit repudiandae dolores qui. Voluptates saepe dolores sint.\n \rEst vero eos consequatur deleniti numquam numquam inventore. Asperiores quasi pariatur expedita ut quod reprehenderit aut laborum voluptate. Quis eius voluptatem harum aut nulla sit delectus aut dolorem.\n \rConsectetur nemo minima nobis velit est sunt. Nisi culpa eum enim consequatur. Eos numquam deserunt praesentium accusamus libero eius dolore voluptate. Iusto voluptatum a dolor officia.	2020-09-22 19:15:39.129199
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	visualize granular portals	Leann42	Unde nemo sit vitae nisi vel fuga quis. Quasi dolor minima illum earum et incidunt totam ea dolores. Assumenda sed sit et facilis nemo incidunt ipsa. Nemo dolores ullam recusandae aspernatur quisquam dolorum veniam dolor. Laudantium cumque tempore veritatis. Aut et ullam aut.\n \rVoluptatem quis est quia accusantium asperiores ipsa. Aut ratione dolores ut asperiores eligendi debitis saepe distinctio. Ut ut vitae et voluptatem numquam. Sed eos et voluptate et quam.\n \rAut possimus excepturi blanditiis officia. Ratione similique provident dolor. At numquam assumenda nesciunt eos.	2020-09-22 19:15:39.131069
e3d32705-a4e8-4070-8224-442c946b05a8	visualize cutting-edge applications	Lola_Rempel20	Culpa aut ratione ut et debitis. Culpa maxime molestias iusto at odit est. Quidem doloribus sed est error qui necessitatibus quibusdam ut.\n \rInventore sequi eius sit quos eius saepe excepturi quis. Fugit dolores sit nam et enim veniam error maxime suscipit. Fugiat quo dolore error ea. Aut et maxime tempora magnam eos autem voluptatem. Sit molestias non odit. Praesentium accusantium et.\n \rSaepe quod expedita sit doloribus maxime et laudantium consequatur. Ipsa temporibus debitis nam. Aut perferendis odit. Sint excepturi aliquam illo. Voluptate tempore eos ipsum eos perferendis. Sunt pariatur aut pariatur.	2020-09-22 19:15:39.131702
87c7c99e-25ff-4921-a4a6-7d158ca12169	productize robust markets	Guillermo76	Harum dolorem ut dolorum dignissimos iure ut modi. Quis nisi est nisi ullam quos velit. Dolor voluptas exercitationem eligendi et ut. Excepturi eum commodi eos odit tenetur laudantium sapiente nulla fuga.\n \rQuia perferendis maiores at similique alias in. Eos a odio molestias et corrupti. Ea dolor est nobis velit. Libero consequuntur tenetur atque. Id aut fugiat beatae magni natus voluptas repellat possimus. Quam magnam quia accusamus sunt quia qui sapiente voluptate.\n \rIusto architecto voluptates quam mollitia accusantium doloremque repudiandae. Qui numquam omnis cumque officiis repellat molestiae rerum eaque eum. Ab fuga qui saepe odit totam dolores illo reprehenderit. Expedita quia aliquam. Asperiores et possimus.	2020-09-22 19:15:39.133573
f41b43a6-0626-4a85-a49d-1e2a1472f52d	syndicate strategic solutions	Gail71	Minus praesentium dicta voluptas molestias quo non repellat doloribus. Beatae aut quia voluptatum ut culpa quam. Error quo totam veniam. Tempore incidunt quas aut magnam omnis dolor accusamus ut.\n \rId pariatur molestias quam. Sint quas tenetur sit. Necessitatibus qui dolore sed odit molestiae quia aspernatur aut. Amet optio provident tempora pariatur quos facere et.\n \rAut ut porro. Sit harum dolorum hic quos aspernatur sint aut ut. Quam voluptate vero neque ab rem voluptatem. Ut ut accusamus. Explicabo sit dignissimos occaecati.	2020-09-22 19:15:39.135082
998c3dbe-b97d-4d99-9519-efb08dc9c63a	implement integrated platforms	Maci.Thompson73	Voluptate est quae placeat molestiae voluptatem ab. Ea modi voluptas excepturi voluptatem cum quod quo. Eum id corporis tempora nesciunt quo molestiae. Sit accusantium minima sapiente. Delectus illum deleniti soluta nihil a.\n \rImpedit consequatur consequatur magni. Voluptatem a quis velit provident blanditiis ad soluta laboriosam. Voluptas est autem qui. Odio nihil id at totam. Reprehenderit error eos qui nam reprehenderit magnam.\n \rSint et dignissimos. Mollitia accusamus quia omnis voluptatum. Eius maiores vel dolor alias officiis et animi dolorum iusto. Dolores ad quia debitis distinctio.	2020-09-22 19:19:24.829306
821f91e3-915a-43dd-89a7-8df33e522565	e-enable magnetic applications	Rey29	Est quaerat voluptatibus quae et ab exercitationem. Minima et similique est temporibus iusto molestiae et dolores. Est modi est veniam dignissimos sint minima et iure ut. Doloribus quis quaerat quod omnis. Nesciunt incidunt officiis. Ad illum velit facere repellendus officiis.\n \rRepellat ut iure asperiores et nam accusantium consectetur quia. Adipisci quos ex. Esse dolorem ea natus excepturi placeat totam.\n \rQuis est quibusdam aut. Dolores amet commodi numquam similique praesentium et et. Quasi aut nesciunt ab fugit.	2020-09-22 19:19:24.831837
c40dc5ad-3af1-49a5-8778-1553e0132a09	unleash dot-com platforms	Hannah58	Placeat omnis iste eveniet odit voluptates et blanditiis qui aut. Minus corrupti aut sunt maiores. Quia exercitationem deleniti dolor quis praesentium et officia.\n \rAd eos placeat tempore praesentium nihil nostrum. Fugiat cum aliquid. Iste sapiente sequi temporibus. Qui natus eos cupiditate et veniam assumenda cumque commodi. Itaque quae occaecati labore incidunt dolor quibusdam alias error.\n \rAliquam ut doloribus doloremque corporis nostrum voluptates. Porro error ipsa magni accusantium occaecati dolores quis. Mollitia quaerat ipsum dolorum eum excepturi rerum nesciunt et. Magni aspernatur explicabo.	2020-09-22 19:19:24.833303
8aa35f89-6206-4ed8-adf8-2b6b431c464d	leverage holistic models	Maci.Thompson73	Aliquid expedita voluptas quibusdam et. Laudantium delectus dolorem qui quasi ex fuga pariatur odio. Omnis quos sint voluptatem quia soluta. Praesentium necessitatibus incidunt voluptate et quas magni. Officiis optio impedit occaecati excepturi.\n \rSint ut et odit in. Voluptate qui veritatis culpa similique. Ut dolorem facere.\n \rEos voluptates excepturi. Quae nulla et quis ut dignissimos explicabo consequatur reiciendis. Pariatur voluptate dolores odit. Ea unde distinctio harum commodi minima.	2020-09-22 19:19:24.834087
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	aggregate enterprise channels	Joan43	Tempora nesciunt nihil. Harum et et porro beatae rerum tempora. Voluptate molestiae repudiandae laboriosam fuga porro omnis officiis facilis.\n \rAnimi mollitia recusandae quidem atque sint voluptatibus nesciunt quaerat voluptatibus. Nihil quisquam tempora possimus voluptas sed vitae voluptate facere. Nulla qui quia maxime. Perferendis sit qui rerum doloremque. Beatae sed repellendus unde totam nam dolor.\n \rUt ipsam soluta dolor accusantium qui velit maiores. Est deserunt molestias dolore consequatur tempore distinctio a ea. Sunt dolorem sed.	2020-09-22 19:19:24.834794
4ac2f167-736f-4f39-be81-2dbe63991d34	cultivate scalable channels	Maci.Thompson73	Ad quaerat fugiat iste dolorem id cupiditate. Dolorem ea et ut aut ut doloremque tempore rerum. Rem velit et repellat tempore nisi et. Dolore officia magni. Libero magnam placeat sequi cumque. Quia corrupti voluptatem nulla minus ut sint deserunt ex est.\n \rAliquid excepturi magni qui quibusdam sint fugit sit blanditiis. Quam doloribus dolorem molestiae magnam et maiores. Libero voluptas nulla velit ab doloribus distinctio. In illum voluptatem minima quo distinctio nesciunt est. At aut cum vel et officiis inventore accusamus est necessitatibus. Dolor occaecati tenetur.\n \rIpsam voluptates quaerat sit voluptatibus culpa. Autem ut et quis qui placeat quaerat ut eaque expedita. Culpa sed omnis.	2020-09-22 19:19:24.835506
93b57384-8822-4eee-89cc-64c16ed25a59	expedite impactful functionalities	Rey29	Vitae qui natus perferendis ipsum iste cupiditate deserunt in. Eveniet molestiae facere deleniti sunt eos quae aut. Quas optio minus. Deleniti et laboriosam qui dolor. Quia id quae suscipit ut.\n \rVoluptate consequatur qui. Placeat rerum reiciendis id blanditiis dolores alias. Voluptatem occaecati omnis labore blanditiis. Nemo ipsum eos ipsa aut doloremque. Alias ut eveniet commodi aspernatur nostrum magni molestiae sapiente omnis. Pariatur eveniet est temporibus similique neque.\n \rQuia quis voluptatem eveniet voluptate illo. Corporis dolorum asperiores perspiciatis sapiente nihil. Perspiciatis dolores non. Quia voluptatibus modi illo error necessitatibus doloremque.	2020-09-22 19:19:24.836186
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	monetize bricks-and-clicks applications	Kirk_Bogisich49	Ipsum ex qui voluptatem fuga voluptas inventore. Enim omnis consequuntur. Laboriosam ut nemo in dolores natus dolores temporibus omnis.\n \rOdio sed quidem officia. Aut quis et porro minus reprehenderit sit laboriosam. Dolores molestiae qui et provident voluptas vel non. Ratione sit ea voluptatibus et. Doloremque voluptas hic rem. Nostrum unde magni voluptatum non et doloribus.\n \rSaepe ut ad aut cum ullam a. Qui assumenda quibusdam dicta. Consequatur omnis impedit hic inventore non ut tempore incidunt. Id eveniet libero voluptates. Minus impedit totam et consequatur accusantium dolores provident qui.	2020-09-22 19:19:24.837695
c7594724-4e46-48bf-b545-dde115e92a96	generate real-time mindshare	Maci.Thompson73	Et mollitia aut ut. Et cumque vel nesciunt. Sint cupiditate quo nihil vel voluptatem reiciendis. Qui in omnis eum. Enim architecto aliquam nihil. Et rerum illo.\n \rMinima laudantium nobis est est sunt. Quo ab odio et sapiente occaecati et quia ea. Velit expedita id.\n \rDolor nesciunt quia et voluptatem velit eveniet nostrum nobis. Labore accusamus qui non voluptas quod mollitia cupiditate dolor. Quia qui eum vitae reprehenderit facere. Possimus facere explicabo. Dolores illo officia quod vero et nesciunt eligendi. Laudantium tempore omnis.	2020-09-22 19:19:24.838973
4f20be2f-df81-4fa6-8b74-7e32211a22b8	enable cross-media platforms	Hannah58	Nobis quibusdam ratione ut et ut veritatis consectetur. Consequatur eos et molestiae ratione. Sit possimus velit pariatur amet doloremque velit odio.\n \rSequi quo quas consectetur. Et voluptatem eius. Harum rerum provident. Est doloremque et ducimus molestiae neque dolorem.\n \rSit sed doloremque. Iusto earum quisquam incidunt. Ab dicta error et et commodi id nobis eum. Adipisci ab dolorem eligendi. Quasi magnam qui.	2020-09-22 19:19:24.84279
7e73540b-772a-49d9-b5c1-49c000461d56	empower integrated paradigms	Joan43	Eaque ut ab porro ea sunt et et vel ratione. Porro iste in. Non beatae saepe et et fuga doloribus temporibus laboriosam.\n \rVitae sint dignissimos ipsa esse repudiandae eligendi. Ut eum est asperiores placeat quos veniam cupiditate numquam. Temporibus ipsum nihil incidunt aut quibusdam.\n \rIn voluptatem aut est ut id. Asperiores aut enim sint esse optio fuga. Ex eligendi dignissimos distinctio quis quasi et nisi. Eligendi eos corporis. Quaerat non qui saepe soluta.	2020-09-22 19:19:24.843419
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	expedite ubiquitous systems	Haleigh_Farrell31	Dolorem et assumenda officiis totam quia. Sequi odio consectetur similique eius ratione reiciendis ducimus tempore eum. Consequatur earum blanditiis non sint. Sequi similique accusantium itaque dicta omnis quia cumque veritatis. Corporis minima quibusdam omnis saepe.\n \rUllam sed ducimus ea beatae. Sed esse non aliquid dolorem deserunt iste optio qui. Blanditiis velit est et repellat. Distinctio autem facilis. Beatae fugiat quaerat nemo praesentium.\n \rVoluptatem neque ipsum omnis deserunt ad. Hic vero vel et reprehenderit. Atque at distinctio a rerum. Harum sequi eum quo aliquam ut aperiam quos. Distinctio ratione esse autem omnis nesciunt. Quia quia et consectetur odit reprehenderit omnis est corrupti commodi.	2020-09-22 19:19:24.844082
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	generate granular vortals	Madalyn.Schinner	Sit consequuntur ut inventore voluptate eum. Quae qui laborum veritatis et atque beatae officia. Deserunt rerum hic. Sint impedit fugit ea. Enim quos consequatur qui necessitatibus et minus reiciendis distinctio pariatur. Ex quisquam ducimus perspiciatis ut nobis quisquam.\n \rFacilis aliquam laudantium nihil voluptas hic aut. Iste occaecati et. Nobis a fugit.\n \rAutem qui corporis animi molestias consequatur sint. Optio nihil cupiditate fuga quia cum. Cum quas voluptatem laboriosam fugit impedit. Mollitia recusandae magnam consequatur animi et dolore voluptatem totam. Recusandae veritatis laudantium.	2020-09-22 19:21:12.182198
eb9c21ab-a064-4de9-921d-c059814f81c7	redefine one-to-one content	Robert88	Ut esse vel sapiente dolorum quibusdam culpa animi optio. Earum voluptatibus illo eligendi sed ut maiores eum laboriosam. Fuga veritatis voluptatem repellat qui quidem veritatis tempore laudantium. Natus sed molestiae quod id. Ab hic ad consequatur fuga inventore adipisci sapiente beatae voluptas. Illum consequatur incidunt deleniti rerum qui necessitatibus quas ab.\n \rRepellendus asperiores voluptas necessitatibus et quia omnis laborum. Vel praesentium libero sit quae. Et omnis sed quam ab quod occaecati consequatur. Iure quos architecto sint rerum corporis nesciunt.\n \rExpedita dolorem illo odit sint et id aut. Odio autem voluptas sed qui quia. Veritatis et cum blanditiis.	2020-09-22 19:21:12.182929
8517aab1-684c-4f3c-bf4d-af4df17e511e	drive bricks-and-clicks methodologies	Isabelle96	Est nulla ratione voluptates doloremque quae recusandae maxime aut ut. Natus autem optio. Possimus sed enim aliquam consequatur voluptatem eum qui.\n \rEt incidunt rerum quaerat quos laborum quis. Sunt at consequatur odit quaerat quisquam occaecati qui. Ut deleniti quia molestias eos cumque facilis. Accusantium perspiciatis aut omnis id omnis.\n \rFugiat molestiae quod. Corporis magni et. Molestias voluptas mollitia accusamus autem aspernatur aliquam.	2020-09-22 19:21:12.183628
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	synergize turn-key networks	Kaylah_Konopelski67	Nisi eius atque odit quisquam necessitatibus quis non magni. Dolores veniam minus rerum voluptatibus fugit quas quia qui doloremque. Sed aut impedit deserunt iste sunt. Esse beatae distinctio sit dolor velit nulla ea quia. Animi impedit eum. Voluptatum qui culpa qui minus.\n \rEarum asperiores vel tempora dolor explicabo. Blanditiis beatae esse voluptas natus aperiam dolore qui porro. Magni quia natus blanditiis. Ipsum dolorem architecto quisquam aut. Et eum qui sequi ut distinctio ut dolorem est.\n \rVelit dicta impedit est eveniet occaecati vel. Dolores distinctio sed suscipit. Doloribus aut ut beatae possimus magnam officia.	2020-09-22 19:21:12.184443
69199805-05c7-4301-8c05-868f29e606d6	cultivate open-source metrics	Curt_Jerde	Et pariatur est tempora dolores quo. Nesciunt ut commodi minima. Molestiae recusandae laboriosam sequi pariatur voluptates nesciunt libero. Vero consectetur officia praesentium nemo ea laborum. Quod ad nostrum iure. Numquam facere sunt nobis consectetur error itaque est veniam.\n \rHarum consequatur dolorem voluptas qui omnis quia dolores sit. Nesciunt quia tempora quam delectus quam molestiae sed alias. Aut esse velit rerum. Aut esse iusto soluta at veritatis. Deserunt dicta beatae. Ab quia illo non sit.\n \rAtque aut mollitia sunt est voluptas velit quo. Eaque ipsa velit quibusdam eligendi hic veritatis. Laboriosam neque hic.	2020-09-22 19:21:12.185531
23c943e0-2ea7-42c7-9112-c77c08073122	scale synergistic e-markets	Celestine.Kshlerin	Nulla temporibus in reiciendis ut consequatur voluptas accusamus voluptas repellat. Debitis qui quod. Architecto animi suscipit necessitatibus explicabo id nemo aspernatur earum architecto. Consequatur molestias ipsum odio vel id. Quod voluptatem debitis. Voluptas iste consectetur hic qui est quasi.\n \rIncidunt culpa sunt aut corrupti eligendi totam. Architecto velit temporibus ab distinctio nostrum vitae quis reiciendis. Iste similique assumenda. Nihil voluptatum voluptatum debitis et neque sint cumque non.\n \rVoluptas non necessitatibus et facilis neque autem ipsum aut. Non ut earum. Sed quos quibusdam modi consequatur voluptatem. Dignissimos facilis dolores nam ipsa qui odit voluptatem est. Tempore ipsam itaque. Quia quod totam dolor sit et.	2020-09-22 19:21:12.187599
58a21a0f-bcbd-4793-9917-e7ed67ee551a	incentivize bricks-and-clicks infrastructures	Kali.Moen	Quasi quia ut saepe quaerat. Quasi harum dignissimos a ex. Magni ad modi aliquid in asperiores eos nihil sit expedita. Ab velit molestiae voluptatem nisi.\n \rOmnis vel non nisi rerum mollitia dolor. Excepturi quibusdam neque nisi. Veritatis sint dolor placeat voluptate enim deserunt repudiandae fuga. Voluptas perferendis iure debitis aliquam aperiam itaque autem quia. Cumque aut molestiae voluptas sed. Perferendis facere odit mollitia esse.\n \rUt recusandae recusandae consequuntur officia quisquam assumenda corporis. Nostrum ipsam ut tempore fugiat quas dolor. Ut aut ex possimus non minus. Ipsa quam adipisci aut nihil itaque nam.	2020-09-22 19:21:12.188693
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	innovate revolutionary ROI	Curt_Jerde	Soluta illum eos labore qui consequatur ab. Ab ut possimus natus consequatur. Asperiores hic deserunt. Alias facilis magnam ipsum ut qui et. Et ab debitis perferendis placeat voluptas minus molestias.\n \rLibero recusandae facere ut officiis sed adipisci ut repellendus. Et error est aliquam eos est odio dolor. Voluptas ut illo. Quisquam nisi et cupiditate cum. Aliquam aut aliquam eligendi. Quod iste laboriosam quas consequatur accusamus ducimus.\n \rInventore ut quo eligendi. Libero aspernatur quo sunt aliquid at laudantium labore et rerum. Ratione assumenda temporibus ipsa voluptas rerum quia consequatur. Recusandae aut dolor. Odio exercitationem eligendi aliquam autem autem.	2020-09-22 19:21:12.189593
108e57ac-5c11-47db-a106-fc3963f7b58d	redefine sexy e-commerce	Elta.Bernhard	Ut et quas dolorem optio iure est. Iure dolor et reiciendis eum fuga nihil aut. Tenetur odit minima. Quia vero sequi et sed est porro voluptatem. Voluptatem distinctio quis quae cumque et autem incidunt. Ut eum architecto voluptatem enim tempora facilis.\n \rIusto amet ut quod rem odio ut excepturi. Autem nihil ipsum distinctio praesentium fugit. Unde tempora qui qui qui molestias quia nesciunt ut commodi. Non nostrum non quam ratione aliquid et minima est est. Quia sint iusto unde iure et id quas. Ut ipsam est ipsum laborum eum.\n \rLaboriosam praesentium saepe fugiat aliquid nisi velit nostrum. Quis reiciendis pariatur sed blanditiis harum odit doloremque. Laudantium nihil officiis. Occaecati excepturi et in. Quaerat occaecati sed et accusamus suscipit nisi atque officiis. Et laborum cum aliquid corporis quo ex.	2020-09-22 19:21:12.191753
857d1eec-bb52-41be-8fe9-dcab56ef9113	aggregate best-of-breed infomediaries	Jalen_Yost	Enim fugiat magni molestiae. Quos minus rem et. Perferendis quis nulla enim ut. Maiores atque nihil in velit ut dolorem.\n \rDeserunt aspernatur fugit suscipit ducimus voluptas. Consequuntur aut labore esse magnam quia inventore et. Similique quod dolores perferendis non possimus neque pariatur delectus. Assumenda ea commodi corrupti ipsam dignissimos dolorem mollitia.\n \rLibero atque est non. Aperiam ea provident quia similique non quo quis. Quo consequatur voluptates modi dolor praesentium labore voluptatum. Earum et fuga aut dicta ducimus consequuntur aut.	2020-09-22 19:21:12.192891
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	orchestrate back-end initiatives	Miller.Yost54	Illum iste molestiae quia dolorem. Debitis et et maxime nostrum nemo quas aspernatur ut. Reiciendis illo et doloremque exercitationem voluptatem tempora. Est nam rem.\n \rSunt ea sit. Nemo quidem ut quia sed. Id illo delectus velit similique beatae nam autem.\n \rNon provident eos expedita aperiam. Et non voluptatem delectus odio hic dolorum enim autem est. Optio nihil libero ut non molestiae explicabo quam facere consequatur. Reprehenderit provident voluptatem hic quam dicta. Sit aut itaque eos voluptatem aliquam repellendus eos rerum excepturi.	2020-09-22 19:21:12.193932
3e7dfef9-b496-460c-a24a-9e90bc06c658	e-enable frictionless initiatives	Kyra_Heidenreich	Voluptas sint quos aut nisi. Est est sunt soluta illum quia. Quod ut adipisci magnam dolore molestiae dolores aspernatur voluptatem ut. Aut ullam quasi voluptatibus nam ducimus eveniet consectetur enim ut. Laudantium non recusandae eum repudiandae beatae quia. Enim ab voluptatem ut ut et cumque adipisci aut fugit.\n \rNihil consectetur ut assumenda necessitatibus. Assumenda est omnis nemo ex deleniti et dolorum. Alias ipsum atque incidunt consequatur officiis. Tempore reprehenderit in molestias doloribus est eaque iusto.\n \rEx et eos vel. Magnam magni nulla dolorum reprehenderit. Dignissimos ea et. Et quia non architecto praesentium veritatis. Cum est distinctio ut ut. Ratione non quaerat.	2020-09-22 19:21:12.19448
2fd317ca-6aeb-401d-af6c-92bcce6f5943	productize best-of-breed infrastructures	Stefan_Prosacco74	Consequatur quisquam porro dignissimos ipsam voluptates aut consequatur. Et corrupti perspiciatis esse autem aut. Facere cum molestiae et voluptates nemo est. Ut voluptatem enim maxime similique est beatae.\n \rDoloremque qui ipsam cumque odio ut perspiciatis. Sapiente quasi ut omnis et. Vel velit eveniet sunt error et totam quam. Iusto et dolorem.\n \rQui architecto beatae rem consequatur laborum delectus ipsum fugit. Perferendis alias modi vitae tempore. Odio quia esse vero aliquid beatae quod sint.	2020-09-22 19:21:12.194994
ad98a18b-91de-4949-aba6-8c04c523dd81	disintermediate real-time e-markets	Skylar.Lesch	Illo tempora eos consectetur. Et quis quae ad reprehenderit consequatur dolor repellendus. Nobis deleniti nulla recusandae. Et voluptatem quidem molestiae eos adipisci non aut sed rerum.\n \rMaiores voluptatibus ut ab rem est possimus ipsa iusto blanditiis. Voluptas quis quos animi illum quia. Est voluptas ipsa suscipit soluta quis. Eius sed autem delectus exercitationem. Ipsum ipsa nemo aut quas. Est et incidunt dolor dolorem itaque.\n \rAut consequatur inventore est nemo et quia enim aut quis. Et numquam amet. Eos provident ut enim cupiditate sed sed fuga deleniti. Ut dolor iste corporis doloribus sed et facilis et laboriosam. Quia voluptas omnis.	2020-09-22 19:21:12.19553
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	scale magnetic portals	Chelsey16	Dolorum sit nesciunt rerum illo deleniti quod assumenda. Quod quas eaque illo error consequatur tempora. Officiis enim culpa eos sit. Laudantium similique qui iusto non tempore odit iusto atque. Fugiat reiciendis quia consequatur quos commodi. A voluptatem ex quas voluptatum repellendus magnam rem odit.\n \rMolestiae tempore nisi. Sunt doloribus at et vel at ab eaque iste. Eum sunt molestiae dolorum enim dolorum. Amet qui ut pariatur sit architecto repudiandae sed ad ipsum. Commodi nihil facilis ab est et molestiae beatae earum. Labore aut et voluptatem vitae voluptatum.\n \rMinus eos ea asperiores velit. Voluptas qui fugit nobis asperiores odio voluptatem suscipit. Quod molestiae molestiae esse in. Rerum numquam aliquid in voluptatem quia quis enim aut non.	2020-09-22 19:21:12.196172
a5f32e66-acb4-44b6-979e-4657a4e3caab	e-enable open-source technologies	Reba_Maggio35	Quos dolorem aliquid tempora. Aut ipsam voluptatem rerum alias officia. Laborum nisi fuga et quis aut dolores blanditiis velit maiores. Dolores amet quis sit est quia veritatis at.\n \rCupiditate repellendus voluptatem non quaerat nihil numquam in iure. Hic cupiditate repudiandae excepturi non veritatis minus officia enim. Et quam est dolorum dolore. Quia ut inventore vitae possimus est est illum.\n \rAspernatur blanditiis voluptate vel illum quam odio. Voluptas corrupti id aut ducimus atque quos. Architecto sit quibusdam laboriosam magnam eum et ex. Voluptatem sit quo dolorum nihil dolores. Reiciendis quos eius ut esse nisi doloribus.	2020-09-22 19:21:12.196705
aa91db1f-fd7e-4869-92b6-2ed892ba1621	revolutionize robust experiences	Mathew82	Corporis voluptas natus similique. Facilis et possimus velit aut explicabo pariatur. Ipsa labore voluptatem.\n \rAssumenda sapiente sed vel numquam nesciunt blanditiis. Eos enim impedit. Id dolor aut doloremque quibusdam consectetur ipsa similique facere. Voluptas voluptatem et aliquid repudiandae dolores dicta dicta voluptatem aut. Velit fugiat est maiores commodi consectetur autem officia.\n \rFacere dolores numquam aut. Voluptatem blanditiis voluptatem ducimus debitis suscipit placeat voluptatem esse a. Pariatur accusamus dicta delectus. Sint necessitatibus nemo quia voluptas officia quos dolores illo. Dolorem maxime et asperiores iusto temporibus aut autem. Enim nihil mollitia exercitationem.	2020-09-22 19:21:12.197203
e6030f49-4156-4c69-8aed-805cb4f8382a	architect dynamic methodologies	Price53	Laboriosam qui quae maiores tenetur est necessitatibus dolorum nesciunt. Consequuntur ut corporis. Dolor perferendis sint qui et est atque. Voluptatum aut qui commodi voluptatibus harum dolores.\n \rDebitis dolor voluptas eos totam. Veniam sed quis voluptates velit. Dolor aut asperiores ut ut maiores et labore quisquam exercitationem. Cupiditate quo sed. Ea consequatur est quis ipsum quia commodi voluptatem.\n \rLaudantium numquam voluptates. Unde reprehenderit voluptatibus ea dolor. Est et est. Laboriosam libero doloremque. Dolorem inventore sint nihil et dolore laborum illo illum.	2020-09-22 19:21:12.198255
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	deploy virtual web-readiness	Cierra.Weissnat11	Iusto quam debitis laboriosam quos aut consequuntur aliquam ipsa. Quae doloremque repudiandae repellat et dolores odio repellendus. Vel voluptatem eligendi nisi labore non magnam. Aut qui aut eaque quod nihil perspiciatis. Inventore nihil soluta amet. Ipsa neque laboriosam dolor non non.\n \rVeniam quam dolores ut voluptatem aut voluptas. Nemo et consequuntur totam. Ut beatae maiores ut id ipsam repudiandae dicta maiores atque. Ipsa sit eos repudiandae in consectetur quo ut eum. Vel odio consequatur voluptatem. Autem temporibus ad esse consequatur id reprehenderit dolores rerum et.\n \rMaiores aspernatur sit non et in recusandae eveniet. Dolores illo repudiandae est non aspernatur odit libero accusantium. Ut nesciunt dolores nam optio voluptatem. Et ad exercitationem.	2020-09-22 19:21:12.198819
29e9c646-3623-4216-ad73-b7a1256a7d8e	morph global users	Lottie.Kutch	Exercitationem dolores modi ullam sint consectetur dolorum ea. Consequatur dignissimos saepe reprehenderit eius. Ad numquam suscipit praesentium.\n \rMollitia ut repellendus rerum quasi et eum ratione. Numquam quaerat consequatur dolore consequatur sunt nesciunt eos perspiciatis voluptatem. Sit eveniet unde quidem consequatur provident nostrum sunt sunt ea. Omnis dolore ut et ipsa alias amet. Iste suscipit aliquid quo qui saepe minima libero alias quia.\n \rVoluptas nihil accusamus ab ab ut at sint voluptatem totam. Quibusdam consequatur facere iure ullam velit id debitis. Beatae aliquid earum incidunt exercitationem ab est a qui optio. Omnis non laudantium. Culpa consequuntur eligendi culpa sint. Aperiam animi ut magni odio.	2020-09-22 19:21:12.200893
2508c094-ff79-4881-b756-74234df008f2	recontextualize turn-key channels	Jalen_Yost	Provident tenetur ut quia dolor quia ut facilis sapiente. Dolorem deserunt earum qui. Laudantium est expedita provident. Magnam porro numquam. Deserunt esse voluptatibus aut voluptatem.\n \rLibero aspernatur rerum et ut quia. Optio aut enim veniam ullam debitis praesentium. Voluptatem voluptates neque consectetur assumenda et natus. Perspiciatis tenetur eum nostrum fuga cumque. Eum natus omnis molestias voluptatum est commodi ducimus.\n \rLibero porro earum hic id. Minima harum quasi voluptate et qui aut animi ipsa et. Id nihil sed molestiae magni illum illo praesentium est. Cum in quia officia ut reiciendis aut perferendis recusandae repudiandae. Omnis consequuntur nisi. Labore quia cumque veniam.	2020-09-22 19:21:12.202044
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	exploit distributed e-commerce	Leda49	Quasi mollitia accusamus sunt enim unde. Similique enim est possimus et et repudiandae laborum. Impedit placeat et veritatis qui. Voluptas molestias et non vitae assumenda veniam doloremque at. Qui dolore doloremque voluptas aut non reprehenderit ut voluptatum.\n \rDolores non deleniti eum illum laborum enim. Veritatis eligendi minus. Enim molestiae aut occaecati unde occaecati unde est sit amet. Et impedit qui.\n \rDucimus consequatur et. Veniam itaque et corporis aut velit. Ut sunt cum ea dignissimos veritatis at dicta earum.	2020-09-22 19:21:12.202816
0d05f1aa-2f12-46f2-a0fa-86e72255635e	orchestrate distributed schemas	Rahsaan.Breitenberg	Eaque aut quia reprehenderit voluptatem earum. In et rem aut impedit aliquam similique. Vel voluptatem sit laboriosam est. Consequatur hic voluptatem. Eum tenetur aut quibusdam unde dolores fugit.\n \rNeque maxime qui. Beatae est blanditiis saepe corrupti ullam. Modi deserunt velit quisquam totam aliquam. Exercitationem et nulla libero culpa perferendis consequatur. Quisquam ducimus nihil.\n \rUllam sapiente laborum eum aspernatur quia ut. Earum vel id adipisci. Non animi laborum.	2020-09-22 19:21:12.20361
60d195d0-3674-4b1e-b907-553b0d57d8be	iterate turn-key applications	Dana_Wisoky	Quia reprehenderit minus id enim eum. Amet aut blanditiis aliquam iste eligendi nulla. Quae earum et similique eum.\n \rNam qui nostrum aut accusantium non. Rerum est quia soluta quis sint omnis blanditiis consequatur. Inventore quibusdam asperiores et inventore non. Voluptas laboriosam aliquam quis officia accusantium iure assumenda ad. Enim vero nihil omnis perferendis. Autem soluta at pariatur dolorem fuga esse ad qui architecto.\n \rEst saepe laudantium ullam sit recusandae voluptate quas voluptas adipisci. Doloribus voluptas qui omnis quo dolorem architecto dolorem qui. Aperiam nam recusandae ad. Animi est velit tenetur sit rerum sequi distinctio ad porro. Rem labore blanditiis. Aperiam quae ipsa sapiente explicabo nesciunt accusamus corrupti ab consequatur.	2020-09-22 19:21:12.204132
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	grow bricks-and-clicks systems	Celestine.Kshlerin	Possimus minima repudiandae recusandae commodi praesentium dolorem earum soluta. Aspernatur libero voluptas dolor. Et est totam voluptatibus quos alias harum. Optio cum facere a esse reprehenderit optio ut dolor. Et in qui praesentium blanditiis beatae.\n \rAssumenda praesentium temporibus tenetur. Reprehenderit et sint architecto. Quod voluptatibus nemo animi modi. Voluptatem aut recusandae voluptas nihil modi vitae distinctio laborum. Voluptatem est voluptatem corporis totam. Repellendus ipsam eius veniam qui qui facere delectus voluptas qui.\n \rAnimi molestiae a eaque. Praesentium cum facilis minus et possimus sed. Tempore explicabo voluptate velit repellat illum cum maxime excepturi. Voluptates beatae repellat cumque reiciendis illo eum qui aut. Quibusdam non repudiandae commodi reiciendis asperiores atque beatae consequatur.	2020-09-22 19:21:12.205743
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	orchestrate back-end mindshare	Kailyn_Wehner6	Aliquid facere occaecati amet delectus neque autem ratione. Quaerat porro temporibus amet aut. Aliquam quibusdam sequi quos minus nemo neque. Voluptate ut odit. Magnam facilis soluta.\n \rQuaerat porro ea maxime quos error numquam repudiandae sunt quidem. Quia officiis nesciunt. Quod error dignissimos odio unde. Sed dignissimos reprehenderit. Sit rerum molestiae qui totam aut repudiandae blanditiis dolorem amet. Sint dolores aut autem voluptatem voluptate.\n \rQui dolores quasi aut qui rerum laudantium voluptas. Suscipit exercitationem qui quis ut laudantium. Voluptatem itaque pariatur exercitationem illum dolore harum amet. Repudiandae doloremque eos cum repudiandae est laudantium.	2020-09-22 19:21:12.206252
eeba34a2-1e00-4c93-af95-b70b4670c5a2	benchmark intuitive networks	Breana23	Accusantium velit ut fugiat id sit et voluptas consequatur rerum. Animi asperiores inventore. Et dicta est ea nulla ullam. Esse itaque quaerat sit. Repellendus eum tempora possimus.\n \rDebitis itaque voluptas laborum dicta consequatur in eos. Sed distinctio nulla sunt quod ut alias aut. Occaecati aut quia explicabo est suscipit molestiae ut aut. Ipsum aspernatur vero ipsam repudiandae sed voluptas delectus. Dolores omnis quam sunt.\n \rAutem enim repellat enim ut enim numquam voluptatem ex. Aut molestiae maxime. Pariatur rerum tempora et eum.	2020-09-22 19:21:12.20784
c8a81b45-cea1-4938-b2bd-5849fea7060d	innovate distributed e-tailers	Johan37	Omnis eius possimus eveniet. Quia ea saepe. Quas ipsum voluptatibus. Tempore consequatur corrupti est aspernatur neque tempore. In reprehenderit sit iure quia doloremque beatae. Illum molestiae sint eius ad aut iure praesentium veritatis at.\n \rAut et sed distinctio tempora doloremque inventore aut praesentium. Est et mollitia voluptate provident nobis sequi. Doloremque pariatur odit qui consectetur sed nam eum.\n \rNemo vitae aut sed explicabo non totam animi. Maiores ratione nulla architecto vitae voluptas reprehenderit recusandae. Perferendis optio expedita. Porro eaque ex nisi.	2020-09-22 19:21:12.208312
596b6c27-1c6e-4870-83f6-3cef204cfc5e	whiteboard customized e-services	Kailyn_Wehner6	Eos qui a eius. Sapiente necessitatibus repudiandae rerum dolore inventore est. Atque laborum voluptatibus excepturi. Incidunt rem dolorem enim deserunt in.\n \rUt voluptatem laborum neque sequi voluptatem ea ullam. Iusto nemo cum quia odit repellendus. Consequatur temporibus quasi qui enim distinctio aspernatur harum.\n \rNihil ad ut. Saepe aspernatur asperiores veniam labore natus autem ducimus aspernatur. Repellat est tempora vel necessitatibus laboriosam quisquam amet.	2020-09-22 19:21:12.226843
fa22a469-463b-44c5-b0f0-63a24be82fef	visualize plug-and-play bandwidth	Joel_Jacobson64	Accusamus molestiae nulla mollitia. Quod iste non dolorem molestias dolores quo. Vero nisi laudantium sunt et. Deserunt aliquam dolor ab nobis. Sed assumenda et non neque culpa fugiat minima cupiditate molestias. Dolor voluptas aliquam.\n \rAut voluptates quos ut. Amet voluptatem excepturi. Corrupti doloremque quam qui voluptatem nisi beatae omnis. Ullam harum autem libero ipsam ad.\n \rFuga laudantium et perspiciatis ex. Porro eum natus quod iste mollitia nihil. Corrupti omnis quam similique aut assumenda eveniet beatae voluptas recusandae. Vero pariatur modi modi exercitationem esse.	2020-09-22 19:21:12.209846
80e81930-37e1-4b4e-9706-cbaf9f163ad6	seize cutting-edge channels	Jolie19	Quisquam maiores ut praesentium delectus. Id qui eveniet tenetur ea tempore consequatur corporis id dolores. Et assumenda accusamus voluptatibus facere saepe harum quia. Hic excepturi repudiandae reprehenderit distinctio dignissimos. Animi voluptatem necessitatibus laboriosam repellat distinctio aut explicabo vel inventore.\n \rQui aut laboriosam nemo reiciendis sed quam quod. Dolore voluptatem consequatur consequatur deleniti quos animi blanditiis. Sed nobis vitae architecto eveniet tempora neque voluptate recusandae blanditiis. Aperiam earum expedita voluptas. Nisi autem non omnis distinctio perspiciatis. Et et cumque.\n \rDebitis quo eaque et optio atque laudantium aut tenetur. Aut eaque iste non veritatis eum excepturi veritatis tenetur in. Aut dolores aut nihil consectetur aut vero.	2020-09-22 19:21:12.210439
adc2f6ed-a31e-43e4-9493-6a18866158d1	empower holistic infomediaries	Koby_Macejkovic	Vel omnis voluptatem harum rerum atque. Aut commodi aut commodi eum neque in doloremque iure consequatur. Pariatur maxime architecto est. Impedit non atque voluptas est quo quod non.\n \rInventore modi quia sint pariatur consequatur quia quos ipsam aperiam. Sint enim et. Eos eos excepturi molestiae non. Expedita quos sed deserunt et aperiam labore iusto. Fugiat et pariatur illum vero pariatur provident.\n \rNobis voluptatum sit tenetur iste corrupti. Quae quibusdam nobis et. Quas quas consequuntur. Deserunt error cupiditate qui. Laudantium iusto dolores corrupti sit.	2020-09-22 19:21:12.210963
b711a645-0b1b-4f01-8c65-3508dffd92f3	engage impactful models	Waino.Reilly9	Consequatur at nobis eos facere aut dolorem est. Quia veniam ex possimus tempora non cupiditate. At at et pariatur in reiciendis rerum.\n \rQui exercitationem ut natus molestias nihil sed. Ab tempore veritatis voluptatem nulla voluptatem qui. Quis accusantium et voluptatem. Atque magnam eaque ex. Qui ut dolorem laborum dolores debitis delectus voluptas. Amet odit officiis blanditiis eum dolores.\n \rInventore voluptatum dignissimos perspiciatis. Fuga voluptate asperiores voluptatum animi. A libero voluptas sequi enim sed quam dolor. Vel quae expedita. Laudantium molestiae sed delectus dicta dolorem nobis ex.	2020-09-22 19:21:12.211938
020f3109-5d91-4cdc-936d-b60387e8f326	target 24/7 communities	Kimberly.Becker	Eius voluptatum recusandae reprehenderit. Quaerat nulla sapiente est et quis eius voluptatum. Corrupti qui quas iste dolorem quis molestiae aut. Libero minus a nisi. Dicta dolorem aut illum repudiandae est doloremque aut.\n \rAnimi ea libero quia deserunt et veritatis. Ut quaerat veritatis. Aut ullam quam dignissimos quaerat enim.\n \rOmnis quaerat ut ullam cumque quod quae reiciendis est reprehenderit. Doloremque doloribus id labore animi qui. Optio eius rerum autem fugiat reiciendis optio quasi. Minima ab assumenda non. Fugit et veritatis.	2020-09-22 19:21:12.212541
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	embrace viral supply-chains	Chester97	Et est porro soluta corporis et omnis natus ut. Corporis nihil cupiditate ut beatae vero est sequi. Vero animi amet quia. Architecto doloremque nostrum quisquam sequi sit sed ea numquam quis. Ipsa occaecati saepe et quis occaecati.\n \rQuod voluptatem voluptatibus nam. Voluptas eaque reiciendis cumque voluptatem. Repudiandae totam maxime ratione non quia. Autem accusamus illo non temporibus consectetur consequatur modi repellendus. Velit enim ullam optio sit praesentium cupiditate veritatis.\n \rAmet sapiente omnis asperiores. Est labore ut cupiditate tempore. Voluptatem aspernatur omnis cum. Porro facilis et rem sequi sed.	2020-09-22 19:21:12.214096
4889ed0c-8b6e-42b6-8a14-9819098eb223	drive end-to-end e-commerce	Gay34	A corrupti vel officia in fugiat aliquam ex sed sed. Animi voluptas vitae quo tempora in asperiores repudiandae non. Cupiditate qui nisi. Ut illum voluptatem et id. Blanditiis omnis hic velit ut animi molestiae ducimus in.\n \rEos sunt repudiandae vel vel consequatur placeat sit nobis. Voluptatem id quis saepe excepturi architecto. Doloremque omnis quidem incidunt ut dolores. Vel dolorem in.\n \rCulpa aliquam pariatur autem hic maiores. Consequatur corporis libero laborum dolor itaque in. Unde quo quidem rerum. Id et deleniti cumque. At consequatur est voluptas. Quis assumenda reprehenderit laboriosam.	2020-09-22 19:21:12.214607
859aea6f-f0b3-4d5c-a417-efcab8d37363	expedite seamless web services	Veronica36	Aliquid sit repellat et. Sunt nam consequatur architecto voluptatum dolor dolor. Voluptatem sed corporis. Officiis eligendi asperiores. Dignissimos necessitatibus qui possimus quo.\n \rNon tempora quia soluta eaque sunt eos voluptas vitae. Et vitae quia sapiente sint possimus. Maxime provident quia sed quisquam eius placeat in est. Dolores nulla possimus. Et facere magnam molestiae dolores sint aut neque.\n \rQui nam facilis dolores. Pariatur nihil sequi aut sit. Reprehenderit corporis ad fugit sed voluptatem qui sed eum temporibus.	2020-09-22 19:21:12.216347
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	exploit impactful relationships	William_Hagenes89	Pariatur quia cumque id et et repellat fuga reiciendis. Voluptate impedit officia dolores quis accusamus ratione officia sit. Distinctio debitis explicabo quisquam accusantium sit repudiandae quas aut. Facere numquam vel eos facere temporibus quia aut.\n \rQui vitae nam illo. Ut est eum quibusdam dolor sit molestiae commodi. Expedita tenetur ut incidunt ad. Eaque neque praesentium modi ipsa sed totam rerum. Enim commodi modi dolor ipsum rerum suscipit. Doloremque ipsum aliquam saepe.\n \rEa porro laudantium placeat magni. Maiores et optio sapiente vitae officia rerum illo ad et. Sequi et fugit numquam dicta.	2020-09-22 19:21:12.216863
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	target bleeding-edge communities	Tiffany_Mueller45	Assumenda quia commodi et. Quibusdam ullam aut minima repellendus. Perferendis ipsa molestias et vero distinctio libero. Laboriosam aut omnis. Consequatur voluptatem eos cupiditate eos dolorem qui quibusdam.\n \rEos tenetur voluptatem mollitia omnis et. Dolores neque et. Ut fugiat quibusdam. Neque sed earum. Minus officia accusamus dolore maiores et.\n \rAut modi repudiandae placeat a eos iusto cupiditate. Ab facilis veritatis officiis necessitatibus qui qui et distinctio tempore. Maiores ut et et incidunt assumenda. Est quis possimus laborum cumque ut nihil. Itaque laborum reprehenderit nostrum dolorem debitis dolorem totam fugiat nihil. Qui eaque et reprehenderit enim ipsum tempore nesciunt quas ea.	2020-09-22 19:21:12.217393
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	streamline dot-com e-markets	Jonathon10	Veritatis mollitia nulla. Mollitia laboriosam autem quos. Omnis facere inventore qui quos nihil et qui. Maiores est voluptatum explicabo quasi natus qui. Qui ratione soluta libero molestiae voluptatem deleniti pariatur suscipit sint.\n \rAut ducimus nemo minima aperiam. Est incidunt hic enim a placeat laboriosam illum. Voluptatem provident et ratione voluptatem quidem sit quia. Aut sapiente ut animi pariatur ipsa fuga. Culpa assumenda nam veniam illum suscipit dicta sapiente quidem.\n \rAut ipsam qui cum laborum error asperiores tempore in nisi. Sint recusandae consectetur iure quia quis porro. Atque fuga consequuntur explicabo eum dolorem nisi. Quia minima quasi quidem qui impedit fuga cupiditate sit velit.	2020-09-22 19:21:12.218418
eb43e6c6-b016-445c-b33c-05468d203319	drive customized convergence	Rahsaan.Watsica36	Debitis voluptas nobis quasi deleniti reiciendis quibusdam autem fugit. Sit dolores odit. Ullam pariatur laboriosam beatae. Aut quam id eos dolorem iure sequi est necessitatibus doloremque. Et consequatur eaque unde sunt dignissimos dolore voluptas voluptatum.\n \rSapiente et tenetur tenetur at aut id dignissimos. Autem sed aut beatae sit nemo inventore esse ut. Molestiae ipsa amet blanditiis maxime laboriosam sunt quis eveniet dolor. Corrupti illo veritatis ipsam. Aut fuga minima aut tempora et dolor excepturi.\n \rRerum ut laudantium. Et quia error debitis suscipit ullam architecto autem iure. Tempora provident voluptatum et nihil dicta. Sint aspernatur excepturi delectus nesciunt et quibusdam maiores repellat.	2020-09-22 19:21:12.219026
8f12c165-b18c-484b-b6e4-8de96add42f0	recontextualize B2C markets	Chester97	Velit labore est ratione et natus hic. Enim sint explicabo quia aspernatur sequi. Repellendus repudiandae ut. Nostrum magni aut et est fugiat.\n \rFugit aut nihil nulla illo. Amet illum eligendi aliquid rerum laborum esse illo et. Eaque repellat distinctio totam itaque eaque blanditiis ea laborum accusantium. Accusantium praesentium aut magnam.\n \rConsequatur magnam esse autem beatae esse rem voluptatem reiciendis amet. Et quibusdam accusamus quis. Itaque animi occaecati ipsum a.	2020-09-22 19:21:12.220111
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	extend user-centric initiatives	Raphaelle17	Voluptas et et. Deleniti explicabo ratione repudiandae. Facilis maxime quia ut. Excepturi et repellendus ea in reiciendis non sit labore eum. Ad et voluptate est.\n \rEarum quasi fuga aut perspiciatis distinctio doloremque earum repudiandae consectetur. Quos blanditiis suscipit omnis placeat voluptatibus dolorem voluptas. Amet quis libero ratione consequatur et consequuntur ratione est hic.\n \rConsequatur aliquid autem molestiae autem qui. Et voluptatibus assumenda. Iure voluptatem nostrum sit itaque quisquam provident molestiae eius placeat. Aliquid sequi modi aliquid consequatur voluptas. Reiciendis repudiandae earum nam dolores iste possimus.	2020-09-22 19:21:12.220599
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	empower clicks-and-mortar interfaces	Iva_Block61	Et cupiditate sed. Fugiat corporis quam aut. Quis ea voluptatibus vero sint. Sed amet illum quos molestias mollitia ipsam voluptatum voluptatem.\n \rQuam veritatis repellat. Facere placeat dicta. In nesciunt quia. Nisi vero inventore.\n \rSaepe id aut quia saepe atque consequatur. Ipsam accusamus neque earum ut saepe. Autem facere autem. Tempore veritatis similique praesentium.	2020-09-22 19:21:12.233594
8592ac88-a537-40f3-b024-c5b90b11a69d	repurpose mission-critical vortals	Cristobal.Hickle	Consectetur quia distinctio temporibus cumque aut veritatis eum dolore. Voluptatum delectus omnis aut voluptatem. Quibusdam beatae quaerat dolorem aut nihil. Laborum id rerum facilis. Nesciunt voluptatem fuga et.\n \rVoluptatem quibusdam minima qui eum harum rerum quos. Tempore et dolorum dolorem adipisci in corporis unde ut. Vel asperiores voluptas suscipit. Non distinctio minima. Perferendis quos deserunt ut ullam excepturi dolorem.\n \rExercitationem non ullam dignissimos. Sint reiciendis aut recusandae et perspiciatis tempora porro numquam consequatur. Laborum quo laborum aut earum saepe doloremque cupiditate ipsam. Quam est in debitis et aut. Occaecati ad eum molestiae laboriosam consequatur. Architecto architecto explicabo quo doloremque nihil sunt eos.	2020-09-22 19:21:12.221116
532a613b-9be2-43e4-82f4-ddce03d99630	transform interactive metrics	Althea.Crooks72	Atque delectus id consequuntur est nulla vero voluptas. Impedit velit nobis fugit omnis. Exercitationem excepturi qui omnis. Sed cupiditate est dicta dolores quasi rerum ea. Sit quia a quo.\n \rRecusandae et qui. Quibusdam aut ipsa repudiandae iure. Explicabo voluptatem aperiam vel molestiae rerum aspernatur. Saepe ullam tenetur sit provident eveniet nostrum tempora qui. Culpa sed voluptas qui eum architecto nisi porro. Perferendis deserunt quidem qui alias quo quo deserunt consectetur.\n \rSapiente non ullam quas. Repudiandae quidem temporibus corrupti perspiciatis qui aut iusto deserunt sint. Fugiat officia numquam. Et repudiandae ut distinctio dolorem dolore quo.	2020-09-22 19:21:12.221676
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	empower interactive e-markets	Pasquale_Considine	Velit saepe molestiae eos at doloribus molestias eaque. Necessitatibus quidem rerum. Aut reiciendis ipsa excepturi maiores. Quo quis eum quia ducimus voluptate et. Explicabo dolores ut maiores labore perferendis est quam.\n \rExercitationem voluptas amet voluptatem ut voluptas ut nesciunt. Nihil aut nulla sed alias praesentium. Blanditiis incidunt ipsam reiciendis. Nihil ut culpa velit nulla voluptatem error magni quam veniam.\n \rOccaecati reprehenderit ea. Porro tempora quo soluta nostrum harum. Officiis officiis et molestiae tempora neque nesciunt sequi omnis.	2020-09-22 19:21:12.222187
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	incentivize proactive action-items	Josue.Hilpert15	Impedit saepe ipsa nulla commodi quas delectus nihil. Saepe suscipit architecto qui iure sed neque quod ipsum adipisci. Modi exercitationem aspernatur minima enim. Ut totam ipsa aspernatur quaerat est amet. Nulla expedita ut id adipisci vero culpa rem beatae.\n \rQuia nemo accusantium maxime ad enim id. Ex esse laboriosam aut in. Consequatur porro nulla nobis est eum neque.\n \rAsperiores esse atque ipsum. Rerum nihil et est doloribus enim animi dolorem. Quia nesciunt quis perspiciatis tempore blanditiis accusantium expedita. Dolorum delectus debitis.	2020-09-22 19:21:12.223742
6e9d3106-eb15-4d80-9c08-c819a0189623	optimize value-added architectures	Ursula_Mills	Omnis amet commodi dicta quaerat quia corporis. Dolores quidem quos beatae et amet facilis. Porro eos fuga eveniet reprehenderit. Est molestiae voluptatem modi voluptatem expedita rem et ut placeat. Modi eligendi sit.\n \rItaque eum autem provident neque voluptas minus eligendi. Voluptatem aspernatur illum nostrum architecto consequuntur. Quo exercitationem voluptates.\n \rMollitia veniam ullam voluptatem illum. Voluptatem est dolore inventore. Ut sit est laborum perspiciatis. Occaecati sint deleniti consequuntur necessitatibus.	2020-09-22 19:21:12.224237
d6295f45-ff33-4b75-9be1-c59902d1e9b8	architect holistic web-readiness	Kali.Moen	Repellendus voluptatem sequi et nemo omnis facilis aliquam. Sit voluptas et ad ipsa quo impedit maxime voluptate nihil. Eos dolores eaque hic quibusdam aut. Expedita et rerum molestiae molestias. Ut et voluptas perspiciatis voluptatum non.\n \rVoluptas voluptatem similique possimus. Cumque esse dolor consectetur ut similique labore sint sint ducimus. Voluptatum inventore eveniet totam in et corporis ut animi rem. Ipsam et at. Est aliquam perspiciatis sit quo nihil unde quas iusto. Accusantium ipsa dolores assumenda et ut.\n \rAliquid eaque rem perspiciatis deserunt praesentium et rerum voluptatibus numquam. Fugiat quas quia quos. Delectus deleniti enim. Aspernatur earum quas illo et molestiae quas. Exercitationem aut ullam aut.	2020-09-22 19:21:12.224788
5d204e1d-c78d-45bc-9c8a-999656dcb32a	revolutionize innovative mindshare	Sallie_Fisher	Officia quisquam consequatur aut. Fugit aut iusto eum qui nemo qui. Quo corporis id minima itaque quod quod ipsa. Eos labore ut.\n \rNeque eius sed et. Impedit minima id et aut. Facere asperiores minus neque architecto. Quae aut nihil adipisci porro eos. Est impedit est illum pariatur.\n \rEum dolores consequatur molestiae unde ut recusandae tempora. Ipsa autem maxime rem voluptas necessitatibus et omnis qui aut. Animi aliquid quia qui. Ut in repudiandae dolorem nihil iusto sequi dolorem sunt.	2020-09-22 19:21:12.225302
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	integrate wireless action-items	Keegan_Prohaska	Aut nam aliquam aut et facere non. Id et eius tenetur dolore nisi quaerat molestias. Aliquid laudantium ipsa ut itaque voluptatem aut architecto qui aspernatur. Cumque rerum aliquid quasi ullam. Ut voluptate consequatur praesentium.\n \rQuam eum in sequi repellendus. Vel maxime in. Ut sint hic nulla. Maiores ut aut est placeat laudantium. Corrupti sed ratione temporibus vel sed esse.\n \rQui iure vel dolores. Est at quo recusandae. Ipsum similique et aliquam exercitationem.	2020-09-22 19:21:12.22585
0a5df6a2-52b4-452a-b91e-3ffb6de09944	strategize distributed networks	Khalid.Barrows22	Laudantium necessitatibus magnam. Rerum accusantium et delectus optio eos quia dolores sunt aut. Illum ut non qui repellendus et eius ut culpa. Sed qui qui voluptatum non non consequatur odit excepturi quidem. Qui consectetur quam quasi.\n \rVoluptas alias dolorem sapiente corporis odit architecto. Minus cupiditate aut cum. Occaecati perferendis sed possimus et quod. Expedita inventore suscipit dolorem velit neque non qui veniam quod. Vero incidunt consectetur distinctio.\n \rQuae voluptas quia tempora omnis ipsam qui voluptas quaerat ullam. Nostrum quis necessitatibus voluptas dolore vitae placeat voluptatibus. Dolore ad voluptatibus. Dolorem inventore provident.	2020-09-22 19:21:12.226357
9654831d-3c0e-4f29-b411-1111d5b059d2	unleash distributed solutions	Domenico_Williamson8	Ullam adipisci explicabo quas veritatis provident et officia iure. Doloremque quo dolores quibusdam necessitatibus ut natus nostrum. Velit esse architecto tempore minima ea harum autem debitis.\n \rTotam eos ab natus et occaecati et vel eos voluptatum. Perferendis mollitia vitae molestias reprehenderit officiis sed sed aut aperiam. Ratione perferendis soluta dolores minus accusamus omnis aut nostrum quia.\n \rVoluptatibus saepe ut omnis. Ratione facilis iste. Et molestias natus dolorem nihil sed quia. Velit molestias eos doloribus sit eum aut. Eius cum placeat sequi sint necessitatibus delectus. Alias expedita minus occaecati nihil consequatur.	2020-09-22 19:21:12.227358
62978666-53c0-4edb-a671-19efd6e9457a	brand viral synergies	Waino.Reilly9	Quo laborum pariatur asperiores quia architecto natus officiis et. Voluptate praesentium qui est vero quis iure quo. At iste aut. Consequatur inventore mollitia dolores quia ut. Cupiditate excepturi cupiditate vitae ullam ullam et quis.\n \rSit maxime nihil consequuntur omnis omnis aut. Omnis velit perspiciatis vel laudantium veniam. Et molestias corrupti commodi iure. Assumenda pariatur qui et dolores a nihil.\n \rPossimus ea est non unde aut minus commodi debitis. Natus odit aut tenetur non nulla quae voluptatibus ratione. Reiciendis ea est adipisci sed blanditiis rerum nulla mollitia.	2020-09-22 19:21:12.227893
2d4f306b-af00-4179-bc53-d3fd89875ba0	monetize compelling bandwidth	Dee86	Debitis saepe et libero quos. Tempore asperiores reprehenderit recusandae nostrum voluptas eum repudiandae dolores doloremque. Voluptatibus consequatur officiis totam asperiores et aut et minus. Quia sit quis provident.\n \rVoluptate hic voluptatum deleniti iure enim voluptatem distinctio. Dolores perferendis eligendi voluptas id odio autem vero est quo. Quia deleniti vel molestiae illum atque ipsam et repellendus. Aut doloribus dicta accusantium enim illo labore voluptatem. Voluptas quibusdam soluta et minus provident ut at non. Et aut fuga qui delectus culpa quaerat est et.\n \rSuscipit aut laborum quas cupiditate. Corporis porro omnis dolor nam. Possimus officia officiis consequatur iure adipisci omnis in amet doloremque.	2020-09-22 19:21:12.228482
ee95e078-4299-4cb4-a596-d4348d73e21a	visualize global channels	Velda.OReilly24	Placeat quo et sit et facilis cum ea qui laboriosam. Reprehenderit illum nemo. Id rerum sit facere unde debitis nemo voluptatibus et consequuntur. Ea et eligendi.\n \rModi similique quis quia earum non nihil. Recusandae fugiat ut corrupti adipisci. Ipsam nisi qui voluptatem sit minima ea sapiente in enim. Et distinctio illum quos. Dolores sapiente non qui quia. Repellat ullam enim voluptate consectetur.\n \rRatione tempore fugiat distinctio et ex sit. Temporibus quia in quas. Id dicta officia nulla voluptates sunt ipsam atque nam. Nisi quo officiis tempora ut repudiandae modi eveniet. Recusandae repellat sit expedita sit praesentium mollitia. Voluptates natus sint aliquid corporis illum quia rem illum.	2020-09-22 19:21:12.229047
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	redefine transparent schemas	Madelyn80	Dolorem ratione esse nemo. Qui animi et possimus maxime odio. Velit porro accusamus culpa. Dolorum aliquid et et qui a sequi et.\n \rMolestiae voluptatem eos dolorum atque ut ipsa odio. Natus temporibus labore reiciendis illo veniam. Eum esse quisquam reprehenderit.\n \rAut fugiat doloribus quaerat qui necessitatibus sed minima. Sed dolorem itaque et veritatis similique sit illum. Fugiat velit vel omnis labore. Aut aspernatur fugit sint autem.	2020-09-22 19:21:12.229537
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	synthesize collaborative channels	Olin_Huels	Officia dolores sunt tenetur enim officia et facilis. Vero nam laboriosam exercitationem dolor et. Perspiciatis recusandae non laudantium. Ut enim consequatur consequatur quam ut voluptates modi blanditiis culpa. Sed deleniti qui. Qui veritatis voluptatibus consequatur quis ad ratione.\n \rTempore nobis nam amet nisi vitae perferendis magnam maxime aliquid. Aliquam voluptates sit. Sunt aperiam natus aspernatur. Unde nihil soluta sint est laudantium recusandae aspernatur accusantium. Debitis id qui dolorem aperiam dolores.\n \rDolorum et asperiores quia harum qui. Beatae quod voluptatibus error dolor quibusdam. Ducimus ut laudantium. Qui error ut voluptas enim qui. Voluptatem earum repudiandae maxime fuga.	2020-09-22 19:21:12.230055
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	reinvent open-source channels	Glen_Krajcik13	Neque cupiditate numquam doloribus ex excepturi libero molestiae vitae. Dolor reprehenderit voluptas quod sed non corporis corrupti quas. Est suscipit itaque non pariatur nobis in sint ut ea. Magni aliquam aut aliquam.\n \rNeque quis enim magnam ratione ratione et repellendus. Nihil error autem nisi illum impedit. Fuga accusantium accusamus accusantium sint deserunt. Qui cumque non ipsam. Quos consequatur at corporis dolore.\n \rTenetur ad ea ducimus quod asperiores labore tempora dolorem. Odit aut aut itaque ut voluptas deserunt a rerum. Quasi maiores tenetur officiis commodi quia sit est. Vel delectus quod mollitia. Quam nihil dignissimos sunt ducimus autem blanditiis aut eius ut.	2020-09-22 19:21:12.230569
885df98a-8a7a-49d2-aba4-86d08b804cb4	implement integrated infomediaries	Kirsten.Reilly	Enim rem iusto repellendus corporis eos. Rerum dolorem dolor quos est sed alias rem et. Odio facere autem sint ab blanditiis aliquid accusantium. Alias quod pariatur voluptate quos dicta saepe maiores suscipit est.\n \rEligendi qui voluptates aliquam id reiciendis. Unde aperiam vero non est omnis a ipsum omnis veritatis. Ut expedita natus veniam laboriosam qui officiis eius corporis voluptatibus.\n \rDoloribus ipsa sint atque qui optio eum illo ea autem. Velit tempore et maiores voluptatem quia. Ipsam rem quisquam veritatis. A ea qui omnis laboriosam laboriosam asperiores consequatur ut.	2020-09-22 19:21:12.231062
fc65f17f-c071-4362-b9bd-4db4308da997	grow strategic niches	Merl.Kutch	Harum id dolores voluptatibus inventore. Doloribus optio quisquam voluptatem ut eligendi autem quisquam accusantium. Minima laudantium ex ut et perferendis. Necessitatibus exercitationem asperiores quos reiciendis facere mollitia illum praesentium ex. Quaerat voluptatibus sequi omnis iusto.\n \rCorporis quo excepturi consequatur in nobis corrupti quia quam. Quae neque sequi assumenda. Qui aut ut esse asperiores ut labore.\n \rMagni beatae iusto quasi nobis et. Eum eaque ut cumque tenetur fugiat veniam. Id nisi aut officiis. Neque non sunt adipisci voluptas ut delectus occaecati. Ullam qui et voluptatem. Nostrum repellat voluptatibus distinctio.	2020-09-22 19:21:12.231561
16a0b69d-3582-47c6-ba91-9c8d9d35202a	enhance bricks-and-clicks experiences	Jarrett_Windler	Quo deserunt magnam eveniet eum dolor sequi et doloremque est. Error voluptas sint ratione. Modi aperiam suscipit dolores officiis et consequatur ad vel quis. Nulla deserunt est.\n \rReprehenderit a eaque qui iure. Sit dolor rerum alias neque neque voluptatibus corporis esse eaque. Ducimus ipsum omnis ullam ducimus rem et. Nisi sit temporibus beatae. Voluptatem eos sunt earum veniam vel. Adipisci non natus odit consectetur veritatis sunt.\n \rEst tenetur non. Vel et quidem eos. Ut et vel omnis voluptas maiores.	2020-09-22 19:21:12.232113
bd42868f-fb3c-417c-8ad4-38e85ca821dd	productize global experiences	Lottie.Kutch	Voluptatibus quaerat dolore ipsa sint necessitatibus voluptatem deserunt et qui. Quia non aut adipisci qui deleniti. Omnis laborum praesentium asperiores adipisci amet suscipit sed qui.\n \rEt ducimus alias qui quaerat et dolores rerum dolorem. Voluptate blanditiis minima rem earum consequuntur dolore animi et ut. Fugit quia ab nulla et et commodi eveniet eum assumenda. Magni autem a ea praesentium cupiditate minus commodi itaque. Aliquid doloribus dolorem dolorem non. Nihil quam in modi laboriosam modi nisi qui ut aut.\n \rVel pariatur voluptate eum reprehenderit. Quo culpa facere sequi rerum ratione maxime totam. Autem nihil ad et veniam. Modi culpa hic architecto voluptatem nihil dolore a atque quaerat.	2020-09-22 19:21:12.234682
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	deliver turn-key niches	Kristin.Gusikowski41	Voluptatem temporibus et voluptatum ea non vero quis. Autem porro ipsum et nostrum eaque in. Voluptate laborum qui.\n \rEt ut ad ab non distinctio. Odit non suscipit tenetur voluptatem consequatur amet iure iste tempora. Iure cupiditate necessitatibus animi et consequatur. Repellat commodi blanditiis sunt et praesentium ullam. Nemo dolorem fuga et ea deserunt quae.\n \rQuo aliquid voluptas odio. Placeat eligendi accusantium ipsam mollitia rerum. Eligendi debitis aut. Similique non quia ut dignissimos. Omnis nostrum dolorem ut alias placeat totam fugiat aperiam odit.	2020-09-22 19:21:12.235285
c9d6d7f8-eb89-4f85-8474-0767c578a03d	optimize efficient mindshare	Cristobal.Hickle	Omnis iusto sed minima voluptates qui modi enim ea vel. Molestias recusandae dicta. Molestiae in ipsa libero saepe. Sunt nihil reprehenderit vel labore nisi.\n \rMolestiae facilis rerum officia recusandae reiciendis magni. Sed magni illum. Porro distinctio ut porro et veritatis amet. Perferendis voluptates laboriosam odio in quisquam ut corrupti sit. Commodi maiores molestias quas. Quia atque nesciunt consequatur autem est excepturi quis.\n \rOdio ex facilis deserunt alias mollitia blanditiis nobis ut. Consequuntur aut veritatis. Sint qui eligendi tenetur. Cum asperiores delectus beatae. Reiciendis dolores distinctio.	2020-09-22 19:21:12.235793
9ecd078c-de1f-40d0-9455-925e4c2c2213	syndicate revolutionary users	Robert88	Odit fuga vel porro laudantium. Placeat sunt nesciunt repellat distinctio at. In velit nobis dicta officiis modi est aliquam eos.\n \rVeniam et iusto ut enim quia error laboriosam iure voluptas. Est quaerat atque est doloribus sed beatae voluptas sed. Atque aut repudiandae voluptas temporibus.\n \rAlias in exercitationem temporibus quasi officiis consequatur minus nemo voluptatem. Earum distinctio laboriosam est expedita dicta. Iusto ut temporibus et vel. Provident omnis sapiente ex ipsam quia velit velit voluptas. Omnis minima voluptas incidunt quia voluptatem.	2020-09-22 19:21:12.236809
970eed6e-3a47-42a9-b90b-a3c049f96751	redefine efficient synergies	Joshua0	Veritatis culpa repudiandae ut optio laboriosam tempora quae natus. Accusamus illum perspiciatis aut quasi possimus nulla veniam magnam praesentium. Nemo repudiandae est labore pariatur nostrum laboriosam. Eum laborum porro odit ad.\n \rTempore sapiente deserunt voluptatem odio harum qui est. Facilis tempora vitae ea harum maxime atque. Quaerat quos sint ut provident est qui esse harum doloribus. Voluptate ab ut aspernatur minima excepturi perspiciatis. Facilis perspiciatis maiores voluptas laboriosam quis aliquam fugit rerum. Quo reprehenderit cumque a voluptatibus.\n \rModi natus necessitatibus rem atque excepturi vero recusandae et unde. Enim quia assumenda mollitia recusandae est soluta. Rerum vel reiciendis nostrum iure. Officia ipsam ea.	2020-09-22 19:21:12.237319
f642ee24-7bc0-46e7-9f71-bd9668df40ac	iterate sexy niches	Otha.Willms	Dolore voluptatem magni quisquam ipsum ducimus possimus in rerum laboriosam. Aut quam perferendis mollitia dolores non. Ratione accusantium voluptatem praesentium est molestiae quod. Quibusdam eaque consequatur enim quisquam et sed in soluta. Beatae aliquid at est. Sint eum delectus qui nostrum quam dolorum voluptas dolorum.\n \rCulpa velit iusto quae nesciunt et id neque dolor et. Corrupti explicabo aut aperiam corporis dolorum. Debitis magnam quidem animi quis magnam suscipit. Vero alias cum et rem laudantium voluptas sit error earum. Architecto nihil quos ducimus neque illum eligendi doloribus quidem.\n \rMagnam dolorem veniam. Consequatur facere nesciunt. Esse aliquam est molestias quia quis qui. Fugiat doloribus fuga nostrum nisi quas placeat rerum ducimus quasi. Dolorum et fugiat in eum ab praesentium laboriosam laboriosam excepturi. Incidunt commodi sapiente quia.	2020-09-22 19:21:12.237867
e4d73f59-9133-4093-a52a-b8043b7cdfb4	empower global bandwidth	Olin_Huels	Velit assumenda praesentium excepturi sed quisquam quia qui quis. Nisi ullam vitae fugit nulla. Consequatur reiciendis non nemo animi quia. Quo quidem aut sed cum tempore suscipit.\n \rEst minima optio tempore. Aut deleniti error accusantium est exercitationem consequatur. Provident quas distinctio eligendi.\n \rNumquam molestiae vitae quasi unde est. Et nihil et. In dolor amet. Numquam commodi laboriosam voluptatem. Rerum quos illum.	2020-09-22 19:21:12.238508
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	orchestrate sticky ROI	Zoe.Hudson65	Laborum eius quae molestiae nostrum qui voluptas. Amet error alias blanditiis ut laboriosam et tempore. Voluptatibus voluptatem beatae. Quam nisi eaque.\n \rSint temporibus fugiat et tempora earum inventore. Maiores voluptas occaecati fugiat ad et perferendis rem ea velit. Aut itaque doloribus quia adipisci consequuntur. Et et alias rerum incidunt delectus.\n \rAccusamus culpa at aperiam qui doloremque aut ullam. Aut vero accusamus veritatis explicabo qui omnis qui. Iste vel ut ut. Distinctio deserunt distinctio.	2020-09-22 19:21:12.239838
96b2311c-d26f-4462-a29c-a94753161467	disintermediate open-source paradigms	Mattie_Wiza	Ipsum et iste. Ut sed fuga alias. Eum rerum suscipit hic sapiente. Ut laudantium ratione nemo dolor voluptas a fugit est et.\n \rAliquid voluptatem sit reiciendis. Inventore omnis qui velit placeat nostrum delectus nesciunt molestias perferendis. Corrupti hic dolor iure omnis dolorum earum praesentium et quas. Dolore impedit et. Autem officia facilis voluptas hic occaecati quibusdam totam cupiditate. Quod inventore rerum exercitationem.\n \rQuia soluta eum. Porro dolor saepe labore quasi aliquid. Sint consequatur delectus illum sapiente voluptatem libero corporis et odio. Sint placeat dolor qui amet quia aut.	2020-09-22 19:21:12.240323
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	transition best-of-breed channels	Lonnie_Gleason	Et at qui consequatur architecto et aut dolorem ea quibusdam. Quo minima autem quidem quia. Repellendus numquam numquam id nostrum ut ab. Excepturi vel blanditiis accusantium veritatis accusamus.\n \rProvident dignissimos voluptas rerum et vero ea nulla. Et aut et temporibus eos rerum quibusdam incidunt molestiae. Iusto rem est.\n \rSunt tempora quod consectetur. Laborum doloribus qui qui quae aut ut eveniet. Voluptate id et. Enim illo explicabo perspiciatis quia aspernatur iure. Voluptates sint perspiciatis qui cum ut.	2020-09-22 19:21:12.240852
\.


--
-- Data for Name: posttags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.posttags (post_id, tag_id) FROM stdin;
33661f21-e0a0-44b4-8ee1-5069de617cd6	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
33661f21-e0a0-44b4-8ee1-5069de617cd6	a949ef90-b6d0-4834-8c66-2ace7bc7ca82
33661f21-e0a0-44b4-8ee1-5069de617cd6	767c230b-a0bc-4362-b9e7-49f51aee513e
33661f21-e0a0-44b4-8ee1-5069de617cd6	1eb3c1cf-2bfb-4db7-80fc-26f12562d3c1
7e73540b-772a-49d9-b5c1-49c000461d56	3f48dd01-4e9e-4716-a05f-5cf169fce841
8aa35f89-6206-4ed8-adf8-2b6b431c464d	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
4ac2f167-736f-4f39-be81-2dbe63991d34	190160ac-5335-459e-b7be-beb4c8412f9b
c7594724-4e46-48bf-b545-dde115e92a96	1867c59c-9f86-4f0f-8b44-f0ef5707251f
c7594724-4e46-48bf-b545-dde115e92a96	190160ac-5335-459e-b7be-beb4c8412f9b
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	8e9e9a8b-ceea-49e2-8f04-6b30c300fb61
7e73540b-772a-49d9-b5c1-49c000461d56	29152ebe-46a7-4ea9-9a23-a2057df2a38d
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	d53b4106-9900-43a3-8e0c-739d030c740f
c7594724-4e46-48bf-b545-dde115e92a96	8e9e9a8b-ceea-49e2-8f04-6b30c300fb61
c40dc5ad-3af1-49a5-8778-1553e0132a09	2e782cf4-e50e-4f5b-aa7c-42654bbb0a07
8aa35f89-6206-4ed8-adf8-2b6b431c464d	cdccc03f-8062-4137-b8cf-2f8bdba97358
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	11db7ed3-61d7-43be-a6e6-95b59ca30a51
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	3f48dd01-4e9e-4716-a05f-5cf169fce841
998c3dbe-b97d-4d99-9519-efb08dc9c63a	334ebc4f-5794-41dd-90c9-4c3cea547177
c7594724-4e46-48bf-b545-dde115e92a96	4049e02f-415e-4cbc-aba2-2c086cec7874
8aa35f89-6206-4ed8-adf8-2b6b431c464d	1eb3c1cf-2bfb-4db7-80fc-26f12562d3c1
c40dc5ad-3af1-49a5-8778-1553e0132a09	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
4f20be2f-df81-4fa6-8b74-7e32211a22b8	8372f41a-bf82-4308-b0e1-66217f74f03d
93b57384-8822-4eee-89cc-64c16ed25a59	190160ac-5335-459e-b7be-beb4c8412f9b
c7594724-4e46-48bf-b545-dde115e92a96	31bf4258-bb4b-469f-b818-4cd424c1c11d
4ac2f167-736f-4f39-be81-2dbe63991d34	d53b4106-9900-43a3-8e0c-739d030c740f
4f20be2f-df81-4fa6-8b74-7e32211a22b8	f6a35ccc-8aa9-434b-9a36-82d174b128f3
821f91e3-915a-43dd-89a7-8df33e522565	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
4f20be2f-df81-4fa6-8b74-7e32211a22b8	190160ac-5335-459e-b7be-beb4c8412f9b
8aa35f89-6206-4ed8-adf8-2b6b431c464d	f6a35ccc-8aa9-434b-9a36-82d174b128f3
93b57384-8822-4eee-89cc-64c16ed25a59	5b75a811-59f9-4c7b-98d6-868abd9beaae
998c3dbe-b97d-4d99-9519-efb08dc9c63a	8244f138-6d48-42d1-9dc3-39d1990589ef
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	b8e52b6d-3616-439b-8480-3d490038a384
c40dc5ad-3af1-49a5-8778-1553e0132a09	5acae5d5-e327-4f08-81c6-037cbf68453d
998c3dbe-b97d-4d99-9519-efb08dc9c63a	4049e02f-415e-4cbc-aba2-2c086cec7874
c7594724-4e46-48bf-b545-dde115e92a96	0ab00073-592f-4c5b-a338-a52ededb1465
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	cdccc03f-8062-4137-b8cf-2f8bdba97358
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	525e7b22-7101-419d-9566-f15ff691556a
4f20be2f-df81-4fa6-8b74-7e32211a22b8	e473b143-c31f-424e-9305-5a8626db80d8
3e7dfef9-b496-460c-a24a-9e90bc06c658	29152ebe-46a7-4ea9-9a23-a2057df2a38d
108e57ac-5c11-47db-a106-fc3963f7b58d	11db7ed3-61d7-43be-a6e6-95b59ca30a51
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	5b75a811-59f9-4c7b-98d6-868abd9beaae
2508c094-ff79-4881-b756-74234df008f2	e29a6359-f838-483e-83f4-236f1f05e0d1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	5b75a811-59f9-4c7b-98d6-868abd9beaae
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	8a0bde67-1ba5-46a9-ae30-a8144eb4f80d
8592ac88-a537-40f3-b024-c5b90b11a69d	2e782cf4-e50e-4f5b-aa7c-42654bbb0a07
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	11db7ed3-61d7-43be-a6e6-95b59ca30a51
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	e9b40003-a5bb-496f-9765-7ae98f90655c
eb9c21ab-a064-4de9-921d-c059814f81c7	5b75a811-59f9-4c7b-98d6-868abd9beaae
9654831d-3c0e-4f29-b411-1111d5b059d2	80d79239-747d-46ba-af49-14356e169187
29e9c646-3623-4216-ad73-b7a1256a7d8e	2e782cf4-e50e-4f5b-aa7c-42654bbb0a07
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	e473b143-c31f-424e-9305-5a8626db80d8
e4d73f59-9133-4093-a52a-b8043b7cdfb4	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	5acae5d5-e327-4f08-81c6-037cbf68453d
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	11db7ed3-61d7-43be-a6e6-95b59ca30a51
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	ebe451a2-0e58-49bb-b119-d08efd09e703
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	d53b4106-9900-43a3-8e0c-739d030c740f
0a5df6a2-52b4-452a-b91e-3ffb6de09944	525e7b22-7101-419d-9566-f15ff691556a
0a5df6a2-52b4-452a-b91e-3ffb6de09944	1867c59c-9f86-4f0f-8b44-f0ef5707251f
0a5df6a2-52b4-452a-b91e-3ffb6de09944	b846a20d-aa0c-47ae-bb70-74de243550ab
9654831d-3c0e-4f29-b411-1111d5b059d2	d53b4106-9900-43a3-8e0c-739d030c740f
4889ed0c-8b6e-42b6-8a14-9819098eb223	f6a35ccc-8aa9-434b-9a36-82d174b128f3
eb43e6c6-b016-445c-b33c-05468d203319	ea422ba2-d561-4a98-ab76-0e0186ee6a92
0d05f1aa-2f12-46f2-a0fa-86e72255635e	190160ac-5335-459e-b7be-beb4c8412f9b
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	29152ebe-46a7-4ea9-9a23-a2057df2a38d
0d05f1aa-2f12-46f2-a0fa-86e72255635e	f6a35ccc-8aa9-434b-9a36-82d174b128f3
eb9c21ab-a064-4de9-921d-c059814f81c7	a949ef90-b6d0-4834-8c66-2ace7bc7ca82
8592ac88-a537-40f3-b024-c5b90b11a69d	d53b4106-9900-43a3-8e0c-739d030c740f
859aea6f-f0b3-4d5c-a417-efcab8d37363	3f48dd01-4e9e-4716-a05f-5cf169fce841
6e9d3106-eb15-4d80-9c08-c819a0189623	334ebc4f-5794-41dd-90c9-4c3cea547177
8f12c165-b18c-484b-b6e4-8de96add42f0	0ab00073-592f-4c5b-a338-a52ededb1465
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	d53b4106-9900-43a3-8e0c-739d030c740f
532a613b-9be2-43e4-82f4-ddce03d99630	ebe451a2-0e58-49bb-b119-d08efd09e703
98d76875-65d1-403b-9f65-e1b77fb25903	31bf4258-bb4b-469f-b818-4cd424c1c11d
eb43e6c6-b016-445c-b33c-05468d203319	604b84e8-d814-4c3a-9cce-9e7dc1525c74
3e7dfef9-b496-460c-a24a-9e90bc06c658	a949ef90-b6d0-4834-8c66-2ace7bc7ca82
857d1eec-bb52-41be-8fe9-dcab56ef9113	1867c59c-9f86-4f0f-8b44-f0ef5707251f
16a0b69d-3582-47c6-ba91-9c8d9d35202a	4049e02f-415e-4cbc-aba2-2c086cec7874
fc65f17f-c071-4362-b9bd-4db4308da997	cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89
596b6c27-1c6e-4870-83f6-3cef204cfc5e	cdccc03f-8062-4137-b8cf-2f8bdba97358
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
fa22a469-463b-44c5-b0f0-63a24be82fef	cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89
a5f32e66-acb4-44b6-979e-4657a4e3caab	ea422ba2-d561-4a98-ab76-0e0186ee6a92
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	b8e52b6d-3616-439b-8480-3d490038a384
eb43e6c6-b016-445c-b33c-05468d203319	767c230b-a0bc-4362-b9e7-49f51aee513e
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	767c230b-a0bc-4362-b9e7-49f51aee513e
f642ee24-7bc0-46e7-9f71-bd9668df40ac	f6a35ccc-8aa9-434b-9a36-82d174b128f3
532a613b-9be2-43e4-82f4-ddce03d99630	e473b143-c31f-424e-9305-5a8626db80d8
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	3f48dd01-4e9e-4716-a05f-5cf169fce841
108e57ac-5c11-47db-a106-fc3963f7b58d	e473b143-c31f-424e-9305-5a8626db80d8
bd42868f-fb3c-417c-8ad4-38e85ca821dd	80d79239-747d-46ba-af49-14356e169187
60d195d0-3674-4b1e-b907-553b0d57d8be	b8e52b6d-3616-439b-8480-3d490038a384
6e9d3106-eb15-4d80-9c08-c819a0189623	18995da5-b886-494f-932f-2e81a03f0ba8
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	41d6a643-8dc4-4331-bca7-b5f6a55d62b2
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	0ab00073-592f-4c5b-a338-a52ededb1465
885df98a-8a7a-49d2-aba4-86d08b804cb4	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	11db7ed3-61d7-43be-a6e6-95b59ca30a51
2fd317ca-6aeb-401d-af6c-92bcce6f5943	1867c59c-9f86-4f0f-8b44-f0ef5707251f
b711a645-0b1b-4f01-8c65-3508dffd92f3	e29a6359-f838-483e-83f4-236f1f05e0d1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	8372f41a-bf82-4308-b0e1-66217f74f03d
80e81930-37e1-4b4e-9706-cbaf9f163ad6	8372f41a-bf82-4308-b0e1-66217f74f03d
fa22a469-463b-44c5-b0f0-63a24be82fef	8244f138-6d48-42d1-9dc3-39d1990589ef
885df98a-8a7a-49d2-aba4-86d08b804cb4	8372f41a-bf82-4308-b0e1-66217f74f03d
98d76875-65d1-403b-9f65-e1b77fb25903	e473b143-c31f-424e-9305-5a8626db80d8
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	a949ef90-b6d0-4834-8c66-2ace7bc7ca82
5d204e1d-c78d-45bc-9c8a-999656dcb32a	b8e52b6d-3616-439b-8480-3d490038a384
9654831d-3c0e-4f29-b411-1111d5b059d2	41d6a643-8dc4-4331-bca7-b5f6a55d62b2
8517aab1-684c-4f3c-bf4d-af4df17e511e	ea422ba2-d561-4a98-ab76-0e0186ee6a92
23c943e0-2ea7-42c7-9112-c77c08073122	cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89
8592ac88-a537-40f3-b024-c5b90b11a69d	1eb3c1cf-2bfb-4db7-80fc-26f12562d3c1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	b846a20d-aa0c-47ae-bb70-74de243550ab
3e7dfef9-b496-460c-a24a-9e90bc06c658	ebe451a2-0e58-49bb-b119-d08efd09e703
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	e9b40003-a5bb-496f-9765-7ae98f90655c
bd42868f-fb3c-417c-8ad4-38e85ca821dd	11db7ed3-61d7-43be-a6e6-95b59ca30a51
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	18995da5-b886-494f-932f-2e81a03f0ba8
970eed6e-3a47-42a9-b90b-a3c049f96751	29152ebe-46a7-4ea9-9a23-a2057df2a38d
e4d73f59-9133-4093-a52a-b8043b7cdfb4	e9b40003-a5bb-496f-9765-7ae98f90655c
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	e29a6359-f838-483e-83f4-236f1f05e0d1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	1867c59c-9f86-4f0f-8b44-f0ef5707251f
5d204e1d-c78d-45bc-9c8a-999656dcb32a	e9b40003-a5bb-496f-9765-7ae98f90655c
fc65f17f-c071-4362-b9bd-4db4308da997	4049e02f-415e-4cbc-aba2-2c086cec7874
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	8a0bde67-1ba5-46a9-ae30-a8144eb4f80d
eb9c21ab-a064-4de9-921d-c059814f81c7	e29a6359-f838-483e-83f4-236f1f05e0d1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	1eb3c1cf-2bfb-4db7-80fc-26f12562d3c1
adc2f6ed-a31e-43e4-9493-6a18866158d1	4049e02f-415e-4cbc-aba2-2c086cec7874
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	8372f41a-bf82-4308-b0e1-66217f74f03d
d6295f45-ff33-4b75-9be1-c59902d1e9b8	3f48dd01-4e9e-4716-a05f-5cf169fce841
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	80d79239-747d-46ba-af49-14356e169187
108e57ac-5c11-47db-a106-fc3963f7b58d	8e9e9a8b-ceea-49e2-8f04-6b30c300fb61
ad98a18b-91de-4949-aba6-8c04c523dd81	525e7b22-7101-419d-9566-f15ff691556a
80e81930-37e1-4b4e-9706-cbaf9f163ad6	1eb3c1cf-2bfb-4db7-80fc-26f12562d3c1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	18995da5-b886-494f-932f-2e81a03f0ba8
9ecd078c-de1f-40d0-9455-925e4c2c2213	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
80e81930-37e1-4b4e-9706-cbaf9f163ad6	cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	e29a6359-f838-483e-83f4-236f1f05e0d1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	5b75a811-59f9-4c7b-98d6-868abd9beaae
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	e473b143-c31f-424e-9305-5a8626db80d8
6e9d3106-eb15-4d80-9c08-c819a0189623	8372f41a-bf82-4308-b0e1-66217f74f03d
8517aab1-684c-4f3c-bf4d-af4df17e511e	3f48dd01-4e9e-4716-a05f-5cf169fce841
60d195d0-3674-4b1e-b907-553b0d57d8be	1867c59c-9f86-4f0f-8b44-f0ef5707251f
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	2e782cf4-e50e-4f5b-aa7c-42654bbb0a07
eb9c21ab-a064-4de9-921d-c059814f81c7	cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	0ab00073-592f-4c5b-a338-a52ededb1465
8592ac88-a537-40f3-b024-c5b90b11a69d	5b75a811-59f9-4c7b-98d6-868abd9beaae
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	18995da5-b886-494f-932f-2e81a03f0ba8
6e9d3106-eb15-4d80-9c08-c819a0189623	80d79239-747d-46ba-af49-14356e169187
4889ed0c-8b6e-42b6-8a14-9819098eb223	cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	cdccc03f-8062-4137-b8cf-2f8bdba97358
885df98a-8a7a-49d2-aba4-86d08b804cb4	ea422ba2-d561-4a98-ab76-0e0186ee6a92
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	b8e52b6d-3616-439b-8480-3d490038a384
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	0ab00073-592f-4c5b-a338-a52ededb1465
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	f6a35ccc-8aa9-434b-9a36-82d174b128f3
596b6c27-1c6e-4870-83f6-3cef204cfc5e	29152ebe-46a7-4ea9-9a23-a2057df2a38d
d6295f45-ff33-4b75-9be1-c59902d1e9b8	334ebc4f-5794-41dd-90c9-4c3cea547177
2d4f306b-af00-4179-bc53-d3fd89875ba0	5b75a811-59f9-4c7b-98d6-868abd9beaae
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	8a0bde67-1ba5-46a9-ae30-a8144eb4f80d
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	0ab00073-592f-4c5b-a338-a52ededb1465
b711a645-0b1b-4f01-8c65-3508dffd92f3	31bf4258-bb4b-469f-b818-4cd424c1c11d
96b2311c-d26f-4462-a29c-a94753161467	a949ef90-b6d0-4834-8c66-2ace7bc7ca82
80e81930-37e1-4b4e-9706-cbaf9f163ad6	b8e52b6d-3616-439b-8480-3d490038a384
96b2311c-d26f-4462-a29c-a94753161467	ebe451a2-0e58-49bb-b119-d08efd09e703
108e57ac-5c11-47db-a106-fc3963f7b58d	4049e02f-415e-4cbc-aba2-2c086cec7874
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	1867c59c-9f86-4f0f-8b44-f0ef5707251f
eb9c21ab-a064-4de9-921d-c059814f81c7	b8e52b6d-3616-439b-8480-3d490038a384
eeba34a2-1e00-4c93-af95-b70b4670c5a2	604b84e8-d814-4c3a-9cce-9e7dc1525c74
e6030f49-4156-4c69-8aed-805cb4f8382a	8244f138-6d48-42d1-9dc3-39d1990589ef
c9d6d7f8-eb89-4f85-8474-0767c578a03d	f6a35ccc-8aa9-434b-9a36-82d174b128f3
020f3109-5d91-4cdc-936d-b60387e8f326	cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89
2d4f306b-af00-4179-bc53-d3fd89875ba0	b846a20d-aa0c-47ae-bb70-74de243550ab
2fd317ca-6aeb-401d-af6c-92bcce6f5943	8e9e9a8b-ceea-49e2-8f04-6b30c300fb61
b711a645-0b1b-4f01-8c65-3508dffd92f3	8a0bde67-1ba5-46a9-ae30-a8144eb4f80d
a5f32e66-acb4-44b6-979e-4657a4e3caab	525e7b22-7101-419d-9566-f15ff691556a
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	4049e02f-415e-4cbc-aba2-2c086cec7874
5d204e1d-c78d-45bc-9c8a-999656dcb32a	ebe451a2-0e58-49bb-b119-d08efd09e703
4889ed0c-8b6e-42b6-8a14-9819098eb223	5acae5d5-e327-4f08-81c6-037cbf68453d
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	8a0bde67-1ba5-46a9-ae30-a8144eb4f80d
8f12c165-b18c-484b-b6e4-8de96add42f0	334ebc4f-5794-41dd-90c9-4c3cea547177
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	8e9e9a8b-ceea-49e2-8f04-6b30c300fb61
d6295f45-ff33-4b75-9be1-c59902d1e9b8	18995da5-b886-494f-932f-2e81a03f0ba8
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	2e782cf4-e50e-4f5b-aa7c-42654bbb0a07
5d204e1d-c78d-45bc-9c8a-999656dcb32a	8244f138-6d48-42d1-9dc3-39d1990589ef
98d76875-65d1-403b-9f65-e1b77fb25903	d53b4106-9900-43a3-8e0c-739d030c740f
16a0b69d-3582-47c6-ba91-9c8d9d35202a	f6a35ccc-8aa9-434b-9a36-82d174b128f3
fc65f17f-c071-4362-b9bd-4db4308da997	1867c59c-9f86-4f0f-8b44-f0ef5707251f
98d76875-65d1-403b-9f65-e1b77fb25903	cdccc03f-8062-4137-b8cf-2f8bdba97358
6e9d3106-eb15-4d80-9c08-c819a0189623	5b75a811-59f9-4c7b-98d6-868abd9beaae
8517aab1-684c-4f3c-bf4d-af4df17e511e	41d6a643-8dc4-4331-bca7-b5f6a55d62b2
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	2e782cf4-e50e-4f5b-aa7c-42654bbb0a07
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	e29a6359-f838-483e-83f4-236f1f05e0d1
c8a81b45-cea1-4938-b2bd-5849fea7060d	334ebc4f-5794-41dd-90c9-4c3cea547177
fc65f17f-c071-4362-b9bd-4db4308da997	0ab00073-592f-4c5b-a338-a52ededb1465
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	3f48dd01-4e9e-4716-a05f-5cf169fce841
fc65f17f-c071-4362-b9bd-4db4308da997	5acae5d5-e327-4f08-81c6-037cbf68453d
fc65f17f-c071-4362-b9bd-4db4308da997	f6a35ccc-8aa9-434b-9a36-82d174b128f3
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	d53b4106-9900-43a3-8e0c-739d030c740f
e6030f49-4156-4c69-8aed-805cb4f8382a	5b75a811-59f9-4c7b-98d6-868abd9beaae
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	cdccc03f-8062-4137-b8cf-2f8bdba97358
8f12c165-b18c-484b-b6e4-8de96add42f0	11db7ed3-61d7-43be-a6e6-95b59ca30a51
e4d73f59-9133-4093-a52a-b8043b7cdfb4	767c230b-a0bc-4362-b9e7-49f51aee513e
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	ea422ba2-d561-4a98-ab76-0e0186ee6a92
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	e9b40003-a5bb-496f-9765-7ae98f90655c
9654831d-3c0e-4f29-b411-1111d5b059d2	8e9e9a8b-ceea-49e2-8f04-6b30c300fb61
eb43e6c6-b016-445c-b33c-05468d203319	41d6a643-8dc4-4331-bca7-b5f6a55d62b2
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	3f48dd01-4e9e-4716-a05f-5cf169fce841
2fd317ca-6aeb-401d-af6c-92bcce6f5943	41d6a643-8dc4-4331-bca7-b5f6a55d62b2
ad98a18b-91de-4949-aba6-8c04c523dd81	8a0bde67-1ba5-46a9-ae30-a8144eb4f80d
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	767c230b-a0bc-4362-b9e7-49f51aee513e
532a613b-9be2-43e4-82f4-ddce03d99630	525e7b22-7101-419d-9566-f15ff691556a
596b6c27-1c6e-4870-83f6-3cef204cfc5e	e9b40003-a5bb-496f-9765-7ae98f90655c
e4d73f59-9133-4093-a52a-b8043b7cdfb4	1867c59c-9f86-4f0f-8b44-f0ef5707251f
16a0b69d-3582-47c6-ba91-9c8d9d35202a	525e7b22-7101-419d-9566-f15ff691556a
8592ac88-a537-40f3-b024-c5b90b11a69d	1c0b6dbc-0967-4ebd-99cd-906900c7aa9b
eeba34a2-1e00-4c93-af95-b70b4670c5a2	cdccc03f-8062-4137-b8cf-2f8bdba97358
eb43e6c6-b016-445c-b33c-05468d203319	11db7ed3-61d7-43be-a6e6-95b59ca30a51
62978666-53c0-4edb-a671-19efd6e9457a	cdccc03f-8062-4137-b8cf-2f8bdba97358
58a21a0f-bcbd-4793-9917-e7ed67ee551a	e7566321-95b7-4b96-87f2-922569a58abe
80e81930-37e1-4b4e-9706-cbaf9f163ad6	18995da5-b886-494f-932f-2e81a03f0ba8
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	5acae5d5-e327-4f08-81c6-037cbf68453d
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, name) FROM stdin;
d53b4106-9900-43a3-8e0c-739d030c740f	startup
5b75a811-59f9-4c7b-98d6-868abd9beaae	fintech
525e7b22-7101-419d-9566-f15ff691556a	leadership
190160ac-5335-459e-b7be-beb4c8412f9b	networking
29152ebe-46a7-4ea9-9a23-a2057df2a38d	economy
e7566321-95b7-4b96-87f2-922569a58abe	AI
767c230b-a0bc-4362-b9e7-49f51aee513e	socialmedia
f6a35ccc-8aa9-434b-9a36-82d174b128f3	productivity
4049e02f-415e-4cbc-aba2-2c086cec7874	IT
31bf4258-bb4b-469f-b818-4cd424c1c11d	mobile
ea422ba2-d561-4a98-ab76-0e0186ee6a92	meditation
18995da5-b886-494f-932f-2e81a03f0ba8	lifestyle
a949ef90-b6d0-4834-8c66-2ace7bc7ca82	education
80d79239-747d-46ba-af49-14356e169187	bitcoin
1eb3c1cf-2bfb-4db7-80fc-26f12562d3c1	ecommerce
8244f138-6d48-42d1-9dc3-39d1990589ef	realestate
1c0b6dbc-0967-4ebd-99cd-906900c7aa9b	seo
e9b40003-a5bb-496f-9765-7ae98f90655c	art
3f48dd01-4e9e-4716-a05f-5cf169fce841	fashion
cdccc03f-8062-4137-b8cf-2f8bdba97358	photography
604b84e8-d814-4c3a-9cce-9e7dc1525c74	nature
2e782cf4-e50e-4f5b-aa7c-42654bbb0a07	style
cd4a6591-bdab-4b53-b3ad-3bcc82ce4b89	fitness
e473b143-c31f-424e-9305-5a8626db80d8	food
8e9e9a8b-ceea-49e2-8f04-6b30c300fb61	beauty
b846a20d-aa0c-47ae-bb70-74de243550ab	music
0ab00073-592f-4c5b-a338-a52ededb1465	animals
8a0bde67-1ba5-46a9-ae30-a8144eb4f80d	design
1867c59c-9f86-4f0f-8b44-f0ef5707251f	artist
e29a6359-f838-483e-83f4-236f1f05e0d1	gym
8372f41a-bf82-4308-b0e1-66217f74f03d	architecture
b8e52b6d-3616-439b-8480-3d490038a384	exploration
ebe451a2-0e58-49bb-b119-d08efd09e703	coffee
334ebc4f-5794-41dd-90c9-4c3cea547177	travel
11db7ed3-61d7-43be-a6e6-95b59ca30a51	streaming
5acae5d5-e327-4f08-81c6-037cbf68453d	video
41d6a643-8dc4-4331-bca7-b5f6a55d62b2	gigeconomy
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (username, password, avatar_url, member_since, bio) FROM stdin;
routePY	$2b$12$NiiWdY8PrUzMLkRT4PrpmuTflM2GIqRqGcKidULHHds8JyqLlRvmm	https://s3.amazonaws.com/uifaces/faces/twitter/rez___a/128.jpg	2020-09-14 14:05:19.903999	
routeP1	$2b$12$x2MFZ9xtwg/xy10StOEil.22276AY52ThWIxQpVG2oaB4XlrpUQ7i	https://s3.amazonaws.com/uifaces/faces/twitter/kylefoundry/128.jpg	2020-09-14 14:05:20.148773	
Velva.Lebsack	$2b$04$yt8jpobrGSTVpGOEO11bteWG67wq0.a/wQedtLLmMoMpSDk6mQ0Ce	https://s3.amazonaws.com/uifaces/faces/twitter/lebinoclard/128.jpg	2020-09-22 19:21:11.747095	Voluptatum eum nobis dicta sit tempore consequatur est illum eligendi.
chicken_guy	$2b$12$qWzFI6Sm.dGN9w3sDCxlqe.glgEWMidxtWdnDxir55tTn8cFIgdZ6	https://s3.amazonaws.com/uifaces/faces/twitter/findingjenny/128.jpg	2020-09-16 15:02:56.990504	A chicken guy with an updated bio
Carlee.Runolfsson	$2b$04$wFK4dOHbh9d2XyDZdDFykO.RczkO57e2ZyHYIZL6P088bkmJmWQA.	https://s3.amazonaws.com/uifaces/faces/twitter/charlesrpratt/128.jpg	2020-09-22 19:15:03.083782	Ad aperiam deserunt eligendi voluptatem.
Rosalia.Aufderhar57	$2b$04$1fU2rWf7zK7DIu5vpfJ9D.s6.VlcPsdDf7ZcFthKYRBcqWD2ZyQZS	https://s3.amazonaws.com/uifaces/faces/twitter/el_fuertisimo/128.jpg	2020-09-22 19:15:03.086793	Eum expedita pariatur dolor nisi architecto.
Eino_Hayes46	$2b$04$LXznl2FPecJzCuYkSIzIe.rCv4BkGtW0JOu8DMOAkydHe7WT6YV36	https://s3.amazonaws.com/uifaces/faces/twitter/kudretkeskin/128.jpg	2020-09-22 19:15:03.092583	Distinctio nam blanditiis molestiae omnis et praesentium veniam est.
Wilford_Hand	$2b$04$YlgTqMlEWJ0mScSRjCqz7uRyh/2/ZYAJeCagdQ1No8tjTw6EBg8.i	https://s3.amazonaws.com/uifaces/faces/twitter/imsoper/128.jpg	2020-09-22 19:15:03.095699	Vitae qui laboriosam eos qui reprehenderit.
Maverick63	$2b$04$m/QitZNxqko422pFgxRqDOElYdxTCZyfbMJl.3aKkvkwcSW66rwHe	https://s3.amazonaws.com/uifaces/faces/twitter/antonyzotov/128.jpg	2020-09-22 19:15:03.100899	Similique vel ipsam iure.
Gail71	$2b$04$P0SuDWlvwsLe//MEv0/.UuAjA4JoI81i9XPgxFlneXMNrvcgXdAKm	https://s3.amazonaws.com/uifaces/faces/twitter/heykenneth/128.jpg	2020-09-22 19:15:39.088142	Cum aut animi.
Guillermo76	$2b$04$ADyTaSW2DxdXxk1l/BpqSuCZgSWACrg91XJT7rX2VTbtg53Lpy0u.	https://s3.amazonaws.com/uifaces/faces/twitter/davidhemphill/128.jpg	2020-09-22 19:15:39.096328	Non cupiditate dignissimos.
Sibyl17	$2b$04$ukUXdf0NdQl.Gnddkc0EMOp0nOxJdmsuTyyZh1rI6cylH8fEjrYHK	https://s3.amazonaws.com/uifaces/faces/twitter/victorDubugras/128.jpg	2020-09-22 19:15:39.099671	Voluptatum minus deleniti quisquam vitae natus minus in beatae.
Lola_Rempel20	$2b$04$6ehEX1UIvNkKPpj/0NCes.kkORUek7f8X3A0AyGL5lpA/SbkPQl0u	https://s3.amazonaws.com/uifaces/faces/twitter/iduuck/128.jpg	2020-09-22 19:15:39.106314	Quos deleniti velit.
Jayce_Connelly7	$2b$04$WQWnCyCW.DNTk1If/efM9uXbLr2FlIkhScmT.8fB7aql5vohwqKWq	https://s3.amazonaws.com/uifaces/faces/twitter/travishines/128.jpg	2020-09-22 19:15:39.10952	Et atque modi dolor qui qui occaecati aspernatur adipisci error.
Oren47	$2b$04$dixYeNDlCOGYftNwfJdmDOpWTMUE/nGMTEBNXbAAMSEImdysEQFK.	https://s3.amazonaws.com/uifaces/faces/twitter/mikaeljorhult/128.jpg	2020-09-22 19:15:39.115445	Laudantium nam dolores autem doloremque odit fugiat mollitia sit quidem.
Leann42	$2b$04$pp.LfLyjnc8Po.cnYVv2YOnXNnhWDOZOE3AMnFE3JrlakNkErAY8K	https://s3.amazonaws.com/uifaces/faces/twitter/herbigt/128.jpg	2020-09-22 19:15:39.118126	Ut voluptatem quidem quia maiores non.
Rey29	$2b$04$cLmv3CuFcsd/wDwOxJNsaOKcEZvHF/6pmigh0oaqWYqjw5BabWSPu	https://s3.amazonaws.com/uifaces/faces/twitter/weglov/128.jpg	2020-09-22 19:19:24.80628	Libero aut ducimus autem dolorem.
Maci.Thompson73	$2b$04$hOaPYkjuhDVHqDGiIyyZfOANGWmxpR2sXEGCrf/SJumlS7Ag4VHtq	https://s3.amazonaws.com/uifaces/faces/twitter/krasnoukhov/128.jpg	2020-09-22 19:19:24.809363	Exercitationem quis rerum distinctio doloremque provident ut et.
Haleigh_Farrell31	$2b$04$DRArcUf1Oy0xtwj4p8WJV.D4fzoh5ufEHj74mB2/o8RKIrtAdqzg2	https://s3.amazonaws.com/uifaces/faces/twitter/carbontwelve/128.jpg	2020-09-22 19:19:24.815319	Amet officia eos ipsum ut aut sequi eos.
Hannah58	$2b$04$aZrObbQq.c1LLQiDxojFC.clEl1wkBQPvFJNIi0ALyb3J9u5wdWE2	https://s3.amazonaws.com/uifaces/faces/twitter/gabrielizalo/128.jpg	2020-09-22 19:19:24.818073	Beatae temporibus ullam assumenda et rerum fugiat atque.
Kirk_Bogisich49	$2b$04$65UXj0lhCsEdRfIogV9qreC6.aKQjqFyByG4SE9.wXyDcHYb8SFF6	https://s3.amazonaws.com/uifaces/faces/twitter/rdbannon/128.jpg	2020-09-22 19:19:24.823156	Ut consequatur quia qui dicta doloribus.
Joan43	$2b$04$Vaq0vd/uSrqT8qiYPjBRf.kMvcKYIh2BfMwfbTS0EOLy2YfpcCEW6	https://s3.amazonaws.com/uifaces/faces/twitter/tumski/128.jpg	2020-09-22 19:19:24.825586	Ullam quos et amet autem voluptate sint dolores sed sunt.
Domenico_Williamson8	$2b$04$hh102AfwlK1kvxq4Kj2Oje.NNffq9uK/6AafDcfKdX0JagIZA80Xm	https://s3.amazonaws.com/uifaces/faces/twitter/michalhron/128.jpg	2020-09-22 19:21:11.753749	Corporis fugiat minus ut reiciendis non aut fugit dicta commodi.
Morgan_Borer	$2b$04$0FPnIPiQqLBpUC2EKKsi9e82y4vPA5hKf/v9fpZBOwtsds7yEL9bS	https://s3.amazonaws.com/uifaces/faces/twitter/pechkinator/128.jpg	2020-09-22 19:21:11.756039	Et nihil at qui nihil.
Leta2	$2b$04$2.v3VlemL5Gk2W/kpyi1JuhGEQ4pv4g.cj7zjfPzB1F56NJskHAXi	https://s3.amazonaws.com/uifaces/faces/twitter/toddrew/128.jpg	2020-09-22 19:21:11.759658	Sint quis tempora minima nisi.
Samanta46	$2b$04$3aAnwvgEcw/VK2BisGPYHOH/4qm8aeRMdBy4CSy1SOXrTSX7b6gH.	https://s3.amazonaws.com/uifaces/faces/twitter/funwatercat/128.jpg	2020-09-22 19:21:11.761403	Ut accusantium et.
Cierra.Weissnat11	$2b$04$aQB13Z/Ha1Io5c1R0QhskuLGG4P3DTMF8WmssDE260pWLiujb/bem	https://s3.amazonaws.com/uifaces/faces/twitter/bungiwan/128.jpg	2020-09-22 19:21:11.765101	Harum non dolore qui non.
Brayan_Hoppe86	$2b$04$ix/6APlKH55PNYfN77zcVONzHGXa6PUVLG0nl2ZEwZs7XFNZ/6a9a	https://s3.amazonaws.com/uifaces/faces/twitter/ryanjohnson_me/128.jpg	2020-09-22 19:21:11.766843	Quis vel quis.
Donna.Rutherford45	$2b$04$u0iL/G11FDThzmi2yCzhV.CBDMNqmePbSP.L8vV8BkiNvTeT3iT2S	https://s3.amazonaws.com/uifaces/faces/twitter/BrianPurkiss/128.jpg	2020-09-22 19:21:11.774714	Amet cum magnam facilis aut et in consequatur ut.
Murl97	$2b$04$2EfaJgz2L2KojDekYekFVuq33qwmiO6wLgoD8HR2zKYGiKL5VUxyO	https://s3.amazonaws.com/uifaces/faces/twitter/danvierich/128.jpg	2020-09-22 19:21:11.776461	Aliquid reprehenderit nemo.
Korey1	$2b$04$6SGwiRC8xduN.spRGwaqnepipsg05k.IFvU3p7h90b1d8lPmcZmA.	https://s3.amazonaws.com/uifaces/faces/twitter/donjain/128.jpg	2020-09-22 19:21:11.779985	Soluta accusamus nihil voluptatum minima sunt et odio ab ut.
Evans11	$2b$04$6RjUEuJ5QV7Vv9aZl8IltuxYEo.gYrxVDjm5T3mi83coZca59nwPm	https://s3.amazonaws.com/uifaces/faces/twitter/arashmanteghi/128.jpg	2020-09-22 19:21:11.781721	Odit voluptatem voluptas.
Ethel.Jacobs	$2b$04$QHL4F/YdgghZmdHVUrNIf.tiC5MvunyGmuuGFoZafphNnG5lm6WJu	https://s3.amazonaws.com/uifaces/faces/twitter/tonymillion/128.jpg	2020-09-22 19:21:11.785419	Molestiae suscipit et quis.
Fern33	$2b$04$ARO9wnC29NvblF6xK6ojQe3Wn05pPj9LJLbm/pkO6cjF10PogelzS	https://s3.amazonaws.com/uifaces/faces/twitter/BryanHorsey/128.jpg	2020-09-22 19:21:11.787055	Impedit voluptates reiciendis reiciendis blanditiis.
Lottie.Kutch	$2b$04$FFcCxDK0VqidDEW.v30wGOT40OfpD0i9R5cbi6CFDo9CLO9IoMx0O	https://s3.amazonaws.com/uifaces/faces/twitter/lhausermann/128.jpg	2020-09-22 19:21:11.790418	Sed libero ad est laudantium.
Price53	$2b$04$jrKfWoBBqiBQQfdTrFaA0.vqoCvaFuHSdRw90UXFyQC6J4iXwo.s2	https://s3.amazonaws.com/uifaces/faces/twitter/oksanafrewer/128.jpg	2020-09-22 19:21:11.792261	Excepturi delectus architecto ipsam et ipsum sit aliquid quos dolore.
Jolie19	$2b$04$gTv6K79iu/WlSWPM3BWDmeQ41SK5ftvAJeXjSyJBKIXgVyuxmgXFu	https://s3.amazonaws.com/uifaces/faces/twitter/victorstuber/128.jpg	2020-09-22 19:21:11.795635	Unde necessitatibus eos consequuntur commodi minus ad voluptatem ad.
Elsie_Rodriguez31	$2b$04$L4RoOBkN7hojaSN/p2syw.2Rt51g6Br3YH5VDE0mw3yg2h045Pnwm	https://s3.amazonaws.com/uifaces/faces/twitter/matthewkay_/128.jpg	2020-09-22 19:21:11.797267	Nemo iste totam consequatur.
Sven97	$2b$04$Ukay0CPbiFfobb4q7GC9suFpgXkM7bltL3tr7.MyOY2PWUanvB1Fu	https://s3.amazonaws.com/uifaces/faces/twitter/a_harris88/128.jpg	2020-09-22 19:21:11.800611	Aspernatur eligendi omnis.
Harley_Gusikowski	$2b$04$ObTiqvkwn7520f5UcJBP6OcaOH3xhFrH.WKA4rkGg7Z4SFaGE36Pm	https://s3.amazonaws.com/uifaces/faces/twitter/vaughanmoffitt/128.jpg	2020-09-22 19:21:11.802379	Quia et sint enim voluptatibus.
Christopher_Senger	$2b$04$uRaksw4FGoZZDdohBVmZT.O7VGHWBtvgfzqi9xRak/XYUcTJblgjm	https://s3.amazonaws.com/uifaces/faces/twitter/blakesimkins/128.jpg	2020-09-22 19:21:11.805675	Qui veniam quas est aperiam quae accusamus fugit ab.
Elijah_Gulgowski59	$2b$04$aZcf1uE.axyLCDXegjpoVeyaLgWgTOCFk0qNTdsGgX35eHFYTV0h2	https://s3.amazonaws.com/uifaces/faces/twitter/alexivanichkin/128.jpg	2020-09-22 19:21:11.807489	Non harum veniam maxime deserunt porro.
Glen_Krajcik13	$2b$04$lufI.3uqiDoOMTwzvLQLY.UyT8kMqHYEh82drT7FA/Gc5vvI3An3q	https://s3.amazonaws.com/uifaces/faces/twitter/iamglimy/128.jpg	2020-09-22 19:21:11.810866	Sequi et dignissimos autem soluta repellendus non quod adipisci dicta.
Camila_Schiller80	$2b$04$oKMH1z8PCQua97LuK1QHs.EbsawXDQdvu7eM9ALgEnQVivDYnbFNW	https://s3.amazonaws.com/uifaces/faces/twitter/renbyrd/128.jpg	2020-09-22 19:21:11.814167	Unde voluptatem commodi est eos expedita quia quis quos.
Bridie.Kilback	$2b$04$w0qYqSzJL/5OFr2.luaH..NyXGkJlBkFjdMDvJOe7OZaSoZ4i1D.e	https://s3.amazonaws.com/uifaces/faces/twitter/stan/128.jpg	2020-09-22 19:21:11.81943	In delectus incidunt quia id.
Velda_Davis	$2b$04$pqLReYy8zbdwkqEp0gnJouedG8KXWP5mcqpU6MZy5znKKqVL9Ibwm	https://s3.amazonaws.com/uifaces/faces/twitter/mhaligowski/128.jpg	2020-09-22 19:21:11.821047	Repudiandae asperiores laborum est voluptatem atque rem.
Veronica36	$2b$04$jKVocDT/9eQgA0nE1PxDS.elpjMm/PQx6x/eW4WOSGoU0rSkKuUBu	https://s3.amazonaws.com/uifaces/faces/twitter/davidcazalis/128.jpg	2020-09-22 19:21:11.824367	Delectus illum et veritatis sint.
Wendell.Greenholt	$2b$04$Iu8tSm/OG.UkpYgoJ2Xl7uQ.I65NxmVA5.DQt9/uE6DNCGIjZuqUS	https://s3.amazonaws.com/uifaces/faces/twitter/jeremymouton/128.jpg	2020-09-22 19:21:11.827622	Id temporibus aut voluptatibus.
Mathew82	$2b$04$K.PhqX0rNPvHgysFnxDvkOzDfyVpnR1m7Du5ydI9NBRaxBtAntAAW	https://s3.amazonaws.com/uifaces/faces/twitter/jqiuss/128.jpg	2020-09-22 19:21:11.83094	Dignissimos qui qui eius.
Herta18	$2b$04$wAYx9QqopBasEIxSqKPtIeHZebV067LaoV8qP9Yvg8cpCRM4AvYPG	https://s3.amazonaws.com/uifaces/faces/twitter/nacho/128.jpg	2020-09-22 19:21:11.832591	Aut est ad perferendis at possimus.
Kailyn_Wehner6	$2b$04$pMEUhoqcgeKNZE.OHOSGXuKAWkj4E4TxFbm/vvDoi1rB3vt5th.96	https://s3.amazonaws.com/uifaces/faces/twitter/chaensel/128.jpg	2020-09-22 19:21:11.835951	Harum adipisci doloremque mollitia iusto.
Rosa.Howe52	$2b$04$vBfwGztrIeMJrBKfLO5wW.zR9FckORBRunVZUPWpoNYaA9NXV5.Zm	https://s3.amazonaws.com/uifaces/faces/twitter/maz/128.jpg	2020-09-22 19:21:11.837533	Consequuntur unde velit quia sit libero.
Gustave.Murazik27	$2b$04$lfcYSGwIoD6mngm8KMyNz.LGkiodk.mL/0OWRyr.hkqnU8Eh/P8p6	https://s3.amazonaws.com/uifaces/faces/twitter/ninjad3m0/128.jpg	2020-09-22 19:21:11.841071	Labore minima nam magnam est velit aperiam esse.
Kali.Moen	$2b$04$HQ0feEsN0RsjdYh.kucPievS82F7bF/xHh0//qMqqw4vRjCTRDXvW	https://s3.amazonaws.com/uifaces/faces/twitter/rickdt/128.jpg	2020-09-22 19:21:11.842794	Nihil ut nam dolores.
Sarina58	$2b$04$wEOfwzLbWoBCmF2SG2BTRuQWfmNmPyZ8HLZf8n.wmfEebrBhKxbSq	https://s3.amazonaws.com/uifaces/faces/twitter/sainraja/128.jpg	2020-09-22 19:21:11.846062	In perspiciatis corporis.
Orlando43	$2b$04$dKsp0USQ7M6zYMAuk8jinOhJbIjPTdvLe5vpwceOGoLnIES4esXPy	https://s3.amazonaws.com/uifaces/faces/twitter/derekebradley/128.jpg	2020-09-22 19:21:11.847674	Molestiae aliquam enim debitis.
Dejon.Mante0	$2b$04$KTUwTHz2uqKBHVr3L3p83.PXzFNtdEf8u.XQ4cFy4lG.MIOOxQaU6	https://s3.amazonaws.com/uifaces/faces/twitter/jacobbennett/128.jpg	2020-09-22 19:21:11.851517	Aut exercitationem aperiam aut voluptas animi.
Willa15	$2b$04$5uhSP7ZC8gzJt57jRdAa0uAbrfZ6C8P9OnlTy1GrtUhEMiOLNil0i	https://s3.amazonaws.com/uifaces/faces/twitter/antonyzotov/128.jpg	2020-09-22 19:21:11.853214	Dignissimos ducimus sunt.
Sunny_Anderson	$2b$04$aiE7KSVs1U95m75rQWG1xe/dhuUOqxlFJ2h94CqcNWlUEinMdwBwO	https://s3.amazonaws.com/uifaces/faces/twitter/charlesrpratt/128.jpg	2020-09-22 19:21:11.85654	Non delectus veniam excepturi neque aut.
Alycia50	$2b$04$JbmN7kSUKFumCjqo4SWxrOVoluOEoawG6WZ.59VHuiBALoQ5uAioO	https://s3.amazonaws.com/uifaces/faces/twitter/zvchkelly/128.jpg	2020-09-22 19:21:11.858234	Id est fugiat ab possimus aperiam consectetur id.
Ari_Johnson	$2b$04$Bap3Sz5xk/ffjZcf.t1j5.yRUHQA1hBVTN2nslXB1DGZpCnw6N8IO	https://s3.amazonaws.com/uifaces/faces/twitter/salleedesign/128.jpg	2020-09-22 19:21:11.86153	Non eius maxime quos aut molestias laudantium.
Miller.Yost54	$2b$04$zfDTJbPA.3st1Kuadu.lquJsA9BceCD1TcP.L.6jc0REwCGGLeUZe	https://s3.amazonaws.com/uifaces/faces/twitter/airskylar/128.jpg	2020-09-22 19:21:11.86315	Est et molestiae necessitatibus doloribus voluptatem dolor aliquam deserunt.
Elissa.Bergstrom	$2b$04$lr2CHLTC4DcaHQNQmC8CguTrFPykjzIefMfiwPS5MG3DD/AzKGNWO	https://s3.amazonaws.com/uifaces/faces/twitter/cboller1/128.jpg	2020-09-22 19:21:11.866446	Quibusdam recusandae eos voluptate aut ratione corrupti.
Daphney_Grimes36	$2b$04$PNMZRgHtO3txU6PxkRwNy.BkK4Ar1yh7zdo5LvpmB.ozGPoSfVSyS	https://s3.amazonaws.com/uifaces/faces/twitter/dgclegg/128.jpg	2020-09-22 19:21:11.868342	Consequuntur repellendus natus vitae tempora aut id asperiores sit.
Lonnie_Gleason	$2b$04$TVA1RVeOieQDZo5OhubuEOXlGSSk4wUjCKAV5Mkrf7bAW7cFw8H0q	https://s3.amazonaws.com/uifaces/faces/twitter/vicivadeline/128.jpg	2020-09-22 19:21:11.871594	Id nesciunt consequuntur a distinctio.
Stefan_Prosacco74	$2b$04$IZbi7jA1I9B9n7QT5ermKezmoXRSJNDYQmHHBYsQXwgJC4NO6uzN6	https://s3.amazonaws.com/uifaces/faces/twitter/ssbb_me/128.jpg	2020-09-22 19:21:11.873242	Accusantium corporis corporis tempora est.
Russ_Reinger56	$2b$04$VEfyaWKdvlUi0U2emi4XgemKwwc.oO/rIkWLi3tpbpWto6Wrw6/VO	https://s3.amazonaws.com/uifaces/faces/twitter/mohanrohith/128.jpg	2020-09-22 19:21:11.876533	Sed cupiditate a aut.
Skylar.Lesch	$2b$04$Tv5XdKOed0cl7s3ATd8ta.csiK0lpMJGSHM.MkHOzUoW53NR5QJgy	https://s3.amazonaws.com/uifaces/faces/twitter/9lessons/128.jpg	2020-09-22 19:21:11.879874	Iure fugit porro ut veniam cum quod ab ut sunt.
Johan37	$2b$04$oNwZnq3tD1hDQEtU3yMBL.PSoe5Qf5rjkiMMYT8uiHa6SdD31TYkq	https://s3.amazonaws.com/uifaces/faces/twitter/felipeapiress/128.jpg	2020-09-22 19:21:11.883292	Facilis optio autem temporibus officia dolor est ipsum.
Dedric.Bartell	$2b$04$oiYSOoMobBX//COpcFLNSeEgu9m29jWng2GJJLm1Uupyk4fHWoZjm	https://s3.amazonaws.com/uifaces/faces/twitter/hsinyo23/128.jpg	2020-09-22 19:21:11.884988	Voluptatem eum similique.
Jalyn.Schaefer56	$2b$04$OX7lBOmPi.UBTbKIpIiYv.mpJs8LfsptW5KxAJsLvKg11zQCMFHqi	https://s3.amazonaws.com/uifaces/faces/twitter/ssbb_me/128.jpg	2020-09-22 19:21:11.888341	Commodi deleniti aliquid soluta ipsam est qui recusandae.
Adelle38	$2b$04$XPVIiWhJnkw56SyXRcl97.cs1C7Ks4kXEn.enGKasGiB4uz/oPSPm	https://s3.amazonaws.com/uifaces/faces/twitter/tonymillion/128.jpg	2020-09-22 19:21:11.890073	Quas quis explicabo.
Nina_Olson	$2b$04$mKCSr89.GVNZ8zDCj4Ruq.5hUGHAGCx/Ydvv3FmslyWVLKh.VMGj.	https://s3.amazonaws.com/uifaces/faces/twitter/dactrtr/128.jpg	2020-09-22 19:21:11.893832	Voluptatum delectus ea accusamus quis sunt.
Malika86	$2b$04$M1E5tNhS/slMkYdSvCoxsOh66RutnvxiZcxOT.Xt0p2atd3TrqTtq	https://s3.amazonaws.com/uifaces/faces/twitter/sreejithexp/128.jpg	2020-09-22 19:21:11.897697	Corporis et sint eveniet facilis.
Mossie82	$2b$04$/FIdsiAOFQ3lYP6TPcPf/OgKwlM5A3FVFISWpzMpWDOB/7vvfG7wS	https://s3.amazonaws.com/uifaces/faces/twitter/iamkarna/128.jpg	2020-09-22 19:21:11.901019	Tempore minus rerum qui.
Mose77	$2b$04$5a35ZHsZcoeFg/p3GsHREu1QJnPz8uwkTe2DfLYPxeWalYGt3dxPi	https://s3.amazonaws.com/uifaces/faces/twitter/kuldarkalvik/128.jpg	2020-09-22 19:21:11.902722	Facilis architecto suscipit velit facilis aut velit facilis sit molestiae.
Breana23	$2b$04$PmxjSFz4W6x8pK/hzTa1VOtyxONiftUWjuU.g1dR4WvqwkXWfB2Rq	https://s3.amazonaws.com/uifaces/faces/twitter/aio___/128.jpg	2020-09-22 19:21:11.906154	At et cumque autem nihil amet.
Desmond_Hauck63	$2b$04$yKRoeYDFhb1jZ7237LGHxuipG7XnpAGx7zoc4Kduogl2472USzJ1u	https://s3.amazonaws.com/uifaces/faces/twitter/danro/128.jpg	2020-09-22 19:21:11.907827	Quae maxime doloremque voluptas molestiae voluptatum ipsam et sed sint.
Sallie_Fisher	$2b$04$S2Qk2hLE0pLBQWi.gCVGtuDu//Tk6Cog454NC1eIsls7yMD8K.hC2	https://s3.amazonaws.com/uifaces/faces/twitter/ryhanhassan/128.jpg	2020-09-22 19:21:11.911178	Recusandae dolores odit unde et neque asperiores rem ullam.
Bryon.Mante	$2b$04$qPDSOnPT3GwkOqpuAJJLpuRHfDejFZOwr6qS3b6ihcgQyKvgpdXFC	https://s3.amazonaws.com/uifaces/faces/twitter/danillos/128.jpg	2020-09-22 19:21:11.912892	Perferendis ut numquam molestiae.
Ronny_Zemlak20	$2b$04$uEHXNidwACnnlVJpvkUbj.S/tNop8FkZDmNl3EzVM8bNlrgJpDEju	https://s3.amazonaws.com/uifaces/faces/twitter/buryaknick/128.jpg	2020-09-22 19:21:11.916304	Nesciunt et magni et minus error ut accusamus laudantium molestiae.
Mattie_Wiza	$2b$04$PMScyvA/I1OF8OLp2yAVhuJYFx3g1feX.9trGBq7ycqZtojE/uC8C	https://s3.amazonaws.com/uifaces/faces/twitter/gonzalorobaina/128.jpg	2020-09-22 19:21:11.918016	Qui eum et possimus consequuntur laboriosam sit libero et.
Dana_Wisoky	$2b$04$aEYMexvIFTFoSc4nc/j1TekPsDytPqlEbXBJqe8Joam.l7cCcOMN.	https://s3.amazonaws.com/uifaces/faces/twitter/hafeeskhan/128.jpg	2020-09-22 19:21:11.921438	Sequi et ex sunt dolor enim.
Karson59	$2b$04$GaqKrxgRY7u2vkIJbEjdbuV252KFMOKB2QUlm6LPJSmfr2r57awBS	https://s3.amazonaws.com/uifaces/faces/twitter/osmond/128.jpg	2020-09-22 19:21:11.923261	Unde alias eum ex nobis quo laborum.
Lisette_Rodriguez	$2b$04$yi.7PM1gEJAm5LpsyAWSLuxiPkwkWqcNq.WmX5P397DG.9LtgXxXG	https://s3.amazonaws.com/uifaces/faces/twitter/xalionmalik/128.jpg	2020-09-22 19:21:11.926626	Nihil veniam numquam est quia magnam aspernatur adipisci.
Otho35	$2b$04$dmWR2g6mlilmsWPESBMgbuYFBXMfuEYdmePLwMfw9VKnzZqZSsdTa	https://s3.amazonaws.com/uifaces/faces/twitter/wegotvices/128.jpg	2020-09-22 19:21:11.928636	Alias eveniet est delectus.
Jackie_Bode2	$2b$04$x6ZBNBa89PG.8h3w.CCCIO3oYzp9t5GZfjMeXmzIfF7HJD9V3otIa	https://s3.amazonaws.com/uifaces/faces/twitter/chrismj83/128.jpg	2020-09-22 19:21:11.93243	Autem voluptas neque deleniti.
Nigel_Abbott	$2b$04$TWjVdJtBAx8CdNYDIhdlY.6RBwHZyETwVt/9PJ5uVOHoPi/O91F12	https://s3.amazonaws.com/uifaces/faces/twitter/coreyhaggard/128.jpg	2020-09-22 19:21:11.934053	Deleniti vel dolorem quas non et ratione inventore.
Darwin64	$2b$04$3ZS6bGSMsVwSqPchR4krbe8QgJydy6FRImGb0kP6GrU.tLdBhacMy	https://s3.amazonaws.com/uifaces/faces/twitter/pixage/128.jpg	2020-09-22 19:21:11.937969	Dolor earum officiis ut odit consectetur.
Edwardo48	$2b$04$s.t3GaOVlHd49DkoajBX/ebDzU4D.1lwKlVvcAmmuBDUInAU1Drnq	https://s3.amazonaws.com/uifaces/faces/twitter/justinrhee/128.jpg	2020-09-22 19:21:11.939635	Asperiores repellat adipisci blanditiis aut culpa nisi reiciendis.
Jarrett_Windler	$2b$04$UZl777KsiQ4cHa504LteAOdaOCDVdRW4Xsu5DaN6jWZn2DVbApSva	https://s3.amazonaws.com/uifaces/faces/twitter/nckjrvs/128.jpg	2020-09-22 19:21:11.944716	Distinctio consequuntur nemo aut optio impedit esse nemo quia alias.
Olin_Nicolas	$2b$04$yYkxDc6IMMf8s2JsZj3SUOaMuo57C/d1IYQ4Giy6.2xDSOesv8dv6	https://s3.amazonaws.com/uifaces/faces/twitter/d_nny_m_cher/128.jpg	2020-09-22 19:21:11.946364	Quo dicta eos dolore aperiam.
Madalyn.Schinner	$2b$04$2nef3FoUsRY7F40Ykz/PAeUhNQilstRGCcBq.NvwNl0ChVPgQpUTq	https://s3.amazonaws.com/uifaces/faces/twitter/leehambley/128.jpg	2020-09-22 19:21:11.949703	Ducimus soluta et blanditiis atque impedit autem.
Merl.Kutch	$2b$04$OQd5ngKIh86p9r73inZ01.J5.0dgSCvj6qsuAmoDGrK4hnCoOwzXa	https://s3.amazonaws.com/uifaces/faces/twitter/elisabethkjaer/128.jpg	2020-09-22 19:21:11.951628	Aut sint consequatur non nihil sed odit.
Cassidy80	$2b$04$HAGa1wYDvvQ2oi.g2IVWieYCupgIPFaSJ/2GzJvXykRFfy0q7ba9S	https://s3.amazonaws.com/uifaces/faces/twitter/antonyryndya/128.jpg	2020-09-22 19:21:11.954865	Ut nisi et est et eos dolorum nisi quia aut.
Rahsaan.Breitenberg	$2b$04$dYHCBEBx/sm8Pv.HzKaNOeSbxQblyvKIx7LnDVWC1EKqihB8tXu1q	https://s3.amazonaws.com/uifaces/faces/twitter/posterjob/128.jpg	2020-09-22 19:21:11.956476	Quam exercitationem dolores omnis omnis maiores velit ut hic et.
Annabelle19	$2b$04$gJpCbxyWf2pkOtMEqcvRAuQ3cTPJ.Pdlm.5ylvDaaCa791bcOiB4q	https://s3.amazonaws.com/uifaces/faces/twitter/janpalounek/128.jpg	2020-09-22 19:21:11.961491	Est labore omnis commodi enim veritatis aut omnis quis.
Chester97	$2b$04$aBJnkzhdCNKsDXAffl2C2e5/.lenmQDMv2XKCM/vkFJvNL/.V3q4C	https://s3.amazonaws.com/uifaces/faces/twitter/diansigitp/128.jpg	2020-09-22 19:21:11.963202	Delectus veritatis odit occaecati consequatur excepturi reprehenderit sed autem.
Eulalia.OConner	$2b$04$0Xyu7dxjW2PeMxNvwp.C7ObkTE3xW3ZSfaEb1hrJHn.JhBmUHGPBq	https://s3.amazonaws.com/uifaces/faces/twitter/hgharrygo/128.jpg	2020-09-22 19:21:11.966507	Impedit quia laudantium quo ratione voluptatem repudiandae omnis et.
Kristin.Gusikowski41	$2b$04$4r2jcwS3eGjaIMmYVcMvxeSrU7WDu33aFWOv.iHz3Bxg9kWzsuwAK	https://s3.amazonaws.com/uifaces/faces/twitter/lhausermann/128.jpg	2020-09-22 19:21:11.9692	Facilis est quasi explicabo et quo est enim nemo aut.
Tiffany_Mueller45	$2b$04$wR7Un4gSzYCzfnjDXMmOWOENhbAytveSjkOxghK5353Ta1ZcbBPYi	https://s3.amazonaws.com/uifaces/faces/twitter/rohixx/128.jpg	2020-09-22 19:21:11.9725	Voluptatem illo sunt veniam a nihil non molestiae deserunt temporibus.
Khalid.Barrows22	$2b$04$.CFwEBD280iDqTuNF6aNU.3YgFOMPL9IXJPb0cIq/6zywjDLT975e	https://s3.amazonaws.com/uifaces/faces/twitter/BenouarradeM/128.jpg	2020-09-22 19:21:11.97439	Expedita iusto beatae sit quia reiciendis voluptatem minus.
Viva.Leuschke66	$2b$04$ZjAs38qFQ.1jVk1YvwT8jugcc.eJvOr.Vbsxnaw18HrWf6q3xKqhi	https://s3.amazonaws.com/uifaces/faces/twitter/low_res/128.jpg	2020-09-22 19:21:11.97769	Est sint quisquam numquam ut.
William_Hagenes89	$2b$04$KbZYb1MzMur4hcfGoPah9udI6UhmTPB7XXGRzPh/rb8tPmiCzNQ7G	https://s3.amazonaws.com/uifaces/faces/twitter/danvierich/128.jpg	2020-09-22 19:21:11.979358	Nemo dolores qui quasi dolorem distinctio voluptas a dicta expedita.
Elta.Bernhard	$2b$04$E7MZtEvRj1p35o0qaNrh7e9gu1tqELpC/d4UAoEeR.8hRMDkVOQdm	https://s3.amazonaws.com/uifaces/faces/twitter/souuf/128.jpg	2020-09-22 19:21:11.982672	Ipsam eum hic dolorum nihil in nostrum.
Tod_Streich2	$2b$04$J6OHz0VXB4tQzqmOls0qAeOaQBUpYWwbUvl9h20n5pzS2/20kwAh2	https://s3.amazonaws.com/uifaces/faces/twitter/clubb3rry/128.jpg	2020-09-22 19:21:11.984326	Sed sed quam architecto.
Joel_Jacobson64	$2b$04$2DQ7WCjXYYP9Odz5ny45EOBUznhC8w8GAShPXw9icYPSPZU2WxCe.	https://s3.amazonaws.com/uifaces/faces/twitter/evanshajed/128.jpg	2020-09-22 19:21:11.987888	Sequi architecto eos repudiandae non quo temporibus sapiente expedita.
Fritz.Keebler	$2b$04$8RCFbdf6RPlkhPFkWBG8uemZqi6rZhKtWHErzu/i1NMHS2V1xU6wK	https://s3.amazonaws.com/uifaces/faces/twitter/petrangr/128.jpg	2020-09-22 19:21:11.989563	Est harum placeat.
Kaylah_Konopelski67	$2b$04$5LvFgcSJWLnPg2WSy3fXneQD5iXS2sSN.N8ug0ow3PUYLYS48tUeW	https://s3.amazonaws.com/uifaces/faces/twitter/oskamaya/128.jpg	2020-09-22 19:21:11.992775	Distinctio illum sapiente.
Gregg_Becker	$2b$04$FO8k6plvM4tQSoPTRXgo5ekqEOcfm2P5QqrMzsqo55MI.uNQV3tia	https://s3.amazonaws.com/uifaces/faces/twitter/taylorling/128.jpg	2020-09-22 19:21:11.994386	Officiis distinctio eum nobis qui sint minus consequuntur error sunt.
Cathrine84	$2b$04$y9opOFKFdbQXuGmzoVoTi.wcTR.12MjTeXf7RIsTE02GvEsRKl4kO	https://s3.amazonaws.com/uifaces/faces/twitter/ariffsetiawan/128.jpg	2020-09-22 19:21:11.997531	Quod at aspernatur cumque omnis non reprehenderit.
Matilde.Weber24	$2b$04$pLkEzfMxhVzJtMQTPD/KUORed.XZNPqwJIdo6uRXlbPxMK359Vm8y	https://s3.amazonaws.com/uifaces/faces/twitter/denisepires/128.jpg	2020-09-22 19:21:11.999312	Aut suscipit labore magnam voluptatibus nihil quae recusandae fugit.
Shad_Prohaska	$2b$04$T/wNf65./cGLqNlyaS1eiuC.Ix.vZo7Kd1Q/GlcUF82RBRqELTiyC	https://s3.amazonaws.com/uifaces/faces/twitter/adhamdannaway/128.jpg	2020-09-22 19:21:12.002751	Cupiditate amet labore.
Veronica.Satterfield42	$2b$04$wGHdfqMyoBxBF1Ke9b9.TeMyisiyx8rdDqhCJO08nFYm9fjEzvHjC	https://s3.amazonaws.com/uifaces/faces/twitter/davidcazalis/128.jpg	2020-09-22 19:21:12.005932	Porro repellat doloribus aut pariatur.
Kimberly.Becker	$2b$04$wRXLn7Ins.HsLyhnaJ60.OILSlNwB4kUCH5xEmRRMuJXzaPvmbB5q	https://s3.amazonaws.com/uifaces/faces/twitter/8d3k/128.jpg	2020-09-22 19:21:12.009177	Et ratione quisquam ab sed dicta.
Rudy_Spinka	$2b$04$NeWXWE2F1Z1XdVEo2gdqWeQSHHvZFePgsEYCnP/DpCX4d5.ik61fO	https://s3.amazonaws.com/uifaces/faces/twitter/dallasbpeters/128.jpg	2020-09-22 19:21:12.01082	Dolor deleniti repudiandae omnis praesentium harum aut.
Rahsaan.Watsica36	$2b$04$dXRY/dKVcDJnhX4LY/PV/uP6PjiRbQZ.4if/d.H0tzX4mx/WIvbsq	https://s3.amazonaws.com/uifaces/faces/twitter/_kkga/128.jpg	2020-09-22 19:21:12.014127	Pariatur consequatur hic ipsum in sed non quia perspiciatis nulla.
Edward_OReilly	$2b$04$2bTrh4IqhYe1lqmEgzRXeeNY9zzshugMgPV6A6J6Y2zONLJmoptlG	https://s3.amazonaws.com/uifaces/faces/twitter/j_drake_/128.jpg	2020-09-22 19:21:12.015731	Sunt corporis officia eaque excepturi in deserunt.
Lauriane_Casper	$2b$04$q9aecL8K47kL.wzXEh.iIObYJsN5aZWBqn8kPaa9XYC1TPuK41u8q	https://s3.amazonaws.com/uifaces/faces/twitter/pmeissner/128.jpg	2020-09-22 19:21:12.019059	Nihil et et suscipit optio.
Koby_Macejkovic	$2b$04$LCaj8om92a2pUVbJ.hGM2eZKOV/fwNcRVMCLQ7To9ewQ3nts0QIdO	https://s3.amazonaws.com/uifaces/faces/twitter/stefanotirloni/128.jpg	2020-09-22 19:21:12.020753	Et rem qui.
Madelyn80	$2b$04$1oEABOryy0SAucde3lSzp.Uo5BMHcMHJBszXPSmn6TMdWOEi76bcK	https://s3.amazonaws.com/uifaces/faces/twitter/coreyhaggard/128.jpg	2020-09-22 19:21:12.02404	Repellat animi commodi distinctio ea ut dolores voluptate.
Gay34	$2b$04$WTRrM/u4lmk3JniKmCdg3evuMAhekiPybHdy4YVtIEztKjBR6Kqz2	https://s3.amazonaws.com/uifaces/faces/twitter/begreative/128.jpg	2020-09-22 19:21:12.025661	Maxime placeat ab et voluptas qui quia perferendis nihil nam.
Isabelle96	$2b$04$TePIZD5RmULB4.VW7fcbAeHBYShrLgJH4MFHxR4aqNofsTSZMDFMS	https://s3.amazonaws.com/uifaces/faces/twitter/nateschulte/128.jpg	2020-09-22 19:21:12.028921	Dolor dolores fuga hic.
Brando_Feeney40	$2b$04$PTkNKt8ELGTjw/5IYfsJAONjxlb6fJFZYZNROwdNeciVJrXSrf53i	https://s3.amazonaws.com/uifaces/faces/twitter/nsamoylov/128.jpg	2020-09-22 19:21:12.030955	Est dolorem eius expedita id itaque debitis.
Raphaelle17	$2b$04$MBxde9kKIjPtXsXTlJzYH.lhiGV0BPu/00qzGmZJzvdrOiVii1mdK	https://s3.amazonaws.com/uifaces/faces/twitter/chandlervdw/128.jpg	2020-09-22 19:21:12.034284	Hic quod sunt sapiente nihil in quia.
Vivianne.Jacobson	$2b$04$e77XrvtuiVNsfOABk3fE6OKeyPxtE4WpFOOen0CiRC6yOmO9BsOby	https://s3.amazonaws.com/uifaces/faces/twitter/badlittleduck/128.jpg	2020-09-22 19:21:12.035837	Officia asperiores autem rerum et cupiditate praesentium sint.
Josue.Hilpert15	$2b$04$ybNiUg9As1TI9M9YvhO7rOIkY7zblEVtu4OkeKELJINYkgIZkURZ6	https://s3.amazonaws.com/uifaces/faces/twitter/jakemoore/128.jpg	2020-09-22 19:21:12.039609	Rerum nulla asperiores tempora consequatur.
Elliott62	$2b$04$to7fQDQr4JtOnCprRplDTOL6agZl4uCUNc3XwbvRjQspUgOAsYpKa	https://s3.amazonaws.com/uifaces/faces/twitter/a1chapone/128.jpg	2020-09-22 19:21:12.041789	Sed magnam sed dolorem similique.
Jalen_Yost	$2b$04$.To7xwjp0rzOedZrKGBtheih4bHt/6TwkG0FXotc/b.z4WaQsoJ.K	https://s3.amazonaws.com/uifaces/faces/twitter/byrnecore/128.jpg	2020-09-22 19:21:12.045777	Ut asperiores quibusdam.
Otha.Willms	$2b$04$TjMS6HMcs6pQUqgr5IM.x.cuWbGsDyGTV6y8b19YvVHP46zpMZoiW	https://s3.amazonaws.com/uifaces/faces/twitter/dmackerman/128.jpg	2020-09-22 19:21:12.049739	Recusandae blanditiis repellat.
Chelsey16	$2b$04$Y/kXbx/brSX3Rs1RGzLZDeHCPjv5ytQZCH3X3YYiCYSvef4C20.Zu	https://s3.amazonaws.com/uifaces/faces/twitter/dvdwinden/128.jpg	2020-09-22 19:21:12.053066	Id velit ratione eligendi unde dolores praesentium.
Flo.Watsica	$2b$04$qujIkJ5puPK14XV4HXKaWegCsGBdZ4MLgAfpkpyvzHaQJHktjOtfi	https://s3.amazonaws.com/uifaces/faces/twitter/nilshoenson/128.jpg	2020-09-22 19:21:12.054776	Provident rerum unde.
Willard85	$2b$04$wtLVVaKl.ilswrRVUIENoOPSqGwA95aj7OT93O7Gt49xoQhjWRaGO	https://s3.amazonaws.com/uifaces/faces/twitter/katiemdaly/128.jpg	2020-09-22 19:21:12.058152	Explicabo qui voluptatum ut eaque suscipit odit illo suscipit officia.
Reba_Maggio35	$2b$04$SVG8agztUlG/qwyJBIhas./PASqnm7TIekXsuf16vY1rPIJM4g33C	https://s3.amazonaws.com/uifaces/faces/twitter/chandlervdw/128.jpg	2020-09-22 19:21:12.059806	Consectetur qui et.
Jazlyn45	$2b$04$ZiIwvbPdhi4Njff1LXsXze5UFTt3Z2zKVm2XEneloK24ZjnApdsgy	https://s3.amazonaws.com/uifaces/faces/twitter/okcoker/128.jpg	2020-09-22 19:21:12.06512	Facilis animi ex quia.
Hector_Mraz33	$2b$04$7vZ6zNL/GpJHuOCclJcjWeHPyZtbdRqIHNbZyvfjfUNcB5kWi3rpK	https://s3.amazonaws.com/uifaces/faces/twitter/fiterik/128.jpg	2020-09-22 19:21:12.066892	Suscipit saepe non dignissimos deserunt rerum.
Jazlyn.Beier5	$2b$04$i7gF8H.ZIN8EdzNYArmC2uqIq/2Rj4H2p6ejNXyDqdKhvx1qe6fgK	https://s3.amazonaws.com/uifaces/faces/twitter/charlesrpratt/128.jpg	2020-09-22 19:21:12.071835	Quo dolorem maiores quo consequuntur hic.
Elvie25	$2b$04$RRuKhm22z8gZ9lEcEf1WGOY4JIfL/PS7k5YwekQMbeivqdEVU2.Fi	https://s3.amazonaws.com/uifaces/faces/twitter/joshuaraichur/128.jpg	2020-09-22 19:21:12.073487	Recusandae sed earum ducimus nihil odio voluptatem et itaque dolorem.
Cristobal.Pfannerstill27	$2b$04$1AFZ/rO6l9qFpg1sy7W8Su37u2YL71fW8cdQbfl0l18gx91MkiIPq	https://s3.amazonaws.com/uifaces/faces/twitter/chadengle/128.jpg	2020-09-22 19:21:12.076797	Rerum vel aut atque distinctio odio.
Zoe.Hudson65	$2b$04$HwcVWXHb8zMhh5SlzVCi1OJViLre3DTPRzm5JwXAOmnqJd8Xd40aK	https://s3.amazonaws.com/uifaces/faces/twitter/exentrich/128.jpg	2020-09-22 19:21:12.078424	Et ut sapiente.
Golden_Raynor	$2b$04$Q3XiyRx/aNgU6w7lVdCI7.uMIAAH9dd06AT7GeJOXdM427wVMFOmO	https://s3.amazonaws.com/uifaces/faces/twitter/bertboerland/128.jpg	2020-09-22 19:21:12.081673	Et tenetur tempore nulla repudiandae non fuga consequatur.
Danyka_Osinski	$2b$04$rTsC/wbZHiDfFb3eorqCpuRxhNehv/ZPXn5h6ZgWOkVV98.U7FCU.	https://s3.amazonaws.com/uifaces/faces/twitter/josemarques/128.jpg	2020-09-22 19:21:12.083333	Maiores fugit cumque omnis molestiae dolores.
Waldo38	$2b$04$Y9ImHRGq09sFcvPmd9YO2eAmgJXWG2.q4nSYhO5VG1.O..pWajnRO	https://s3.amazonaws.com/uifaces/faces/twitter/terpimost/128.jpg	2020-09-22 19:21:12.086695	Delectus necessitatibus dolores non aspernatur et voluptas.
Kyra_Heidenreich	$2b$04$osXfzOm5YPDeRjZ3e4uRWuVeisNaJmW2m3vxM2USIuT8z0b2AtWk6	https://s3.amazonaws.com/uifaces/faces/twitter/superoutman/128.jpg	2020-09-22 19:21:12.088298	Provident tempore nobis alias maxime culpa.
Kirsten.Reilly	$2b$04$Z2zEO6YapndntZuquG1UpuCwE.9mP/rf8c5uwjtjyy3nb/WUzPwES	https://s3.amazonaws.com/uifaces/faces/twitter/woodydotmx/128.jpg	2020-09-22 19:21:12.091563	Earum alias tempora fuga doloribus minima assumenda sed ab libero.
Henry31	$2b$04$xmXyuHo0kqZ6w8WelUkCyeOIfQQqsn3Q3X1s1oPoYm98Obhr.kOxe	https://s3.amazonaws.com/uifaces/faces/twitter/betraydan/128.jpg	2020-09-22 19:21:12.09318	Aliquid harum sed aut non qui cumque delectus sequi.
Jonathon10	$2b$04$ebMARlEhkcRI5tB2UUw8peg4f7uYSO0/oxYMs2HWNiiQGZgrsxELa	https://s3.amazonaws.com/uifaces/faces/twitter/stefanotirloni/128.jpg	2020-09-22 19:21:12.096441	Voluptatem sint debitis et.
Celestine.Kshlerin	$2b$04$lwIjRFx.dNC7Moi8IuJ5VOZE1oAlehYl9Iyb/snw59ApqMkT6ewqO	https://s3.amazonaws.com/uifaces/faces/twitter/aaroni/128.jpg	2020-09-22 19:21:12.098077	Iste eum corporis.
Lindsey38	$2b$04$NxfnKbAQSqbx8NIezHAX/.coW1KWInYYIhHthHgWHntwevUmOcOhi	https://s3.amazonaws.com/uifaces/faces/twitter/lewisainslie/128.jpg	2020-09-22 19:21:12.101338	Quod reprehenderit similique earum impedit.
Darwin45	$2b$04$Cbkh3BuY1G4Shyukzu01AOYW/4BmeFNgVwHq3YGxCTQdDkXRMTY7m	https://s3.amazonaws.com/uifaces/faces/twitter/michaelcomiskey/128.jpg	2020-09-22 19:21:12.102942	Nam nesciunt blanditiis similique a labore iste ad.
Jean_Leffler	$2b$04$Hyva7skPO2FyJJ5cPR3kX.ydGzvGAI7Vm6sWEW5db4c2YeiFjJBPm	https://s3.amazonaws.com/uifaces/faces/twitter/hgharrygo/128.jpg	2020-09-22 19:21:12.106268	Quas quia voluptas autem rem quod distinctio.
Pasquale_Considine	$2b$04$oh8VH4w3oDw2rR29D6GMo.IV97/SEGY/cgVm5vGc56gGGTbl6uy4e	https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg	2020-09-22 19:21:12.108316	Magnam quam doloribus laborum iste id voluptatibus consectetur.
Melyssa_Halvorson	$2b$04$whh5VVHZezFDal.kH43tEOf2DHoZB2QiulDBjGoh80iRQ6L4g7RL.	https://s3.amazonaws.com/uifaces/faces/twitter/derekebradley/128.jpg	2020-09-22 19:21:12.113402	Ut sed dignissimos sed similique omnis numquam ex.
Ursula_Mills	$2b$04$/G.UMW7VsNmHAP4k4Gqt/u/.7qLVOIYJJhwhf9.EehXX0PJH4nt0q	https://s3.amazonaws.com/uifaces/faces/twitter/jjsiii/128.jpg	2020-09-22 19:21:12.11506	Doloribus rerum tempore cumque.
Leda49	$2b$04$0AueulHYL12UvNxJzSYUTOL/0XqJ/gZjOrr7VMaPiKRq7ileHAvr2	https://s3.amazonaws.com/uifaces/faces/twitter/slowspock/128.jpg	2020-09-22 19:21:12.118346	Eveniet rem consequatur provident.
Consuelo.Cartwright99	$2b$04$fip0hEWHt2MQFzDTKyFD/O7lt9CX7hj3mOYkYzumaeEwMa2otPTeG	https://s3.amazonaws.com/uifaces/faces/twitter/guiiipontes/128.jpg	2020-09-22 19:21:12.120005	Fugiat magni qui reiciendis vero dignissimos esse.
fish_guy	$2b$12$a5ZfhoXHHk4r/xA3VrPiB.GwTGbdQlT2NIOxr57ACebEsBbb9GbPi	https://s3.amazonaws.com/uifaces/faces/twitter/scottgallant/128.jpg	2020-09-02 14:23:00.454338	
Karley.Klocko63	$2b$04$rwjgdbeJUz.2Aw5NlMXZJuP6hg/N/AvloFz8IlV32BPtl3eMu.KIK	https://s3.amazonaws.com/uifaces/faces/twitter/VMilescu/128.jpg	2020-09-22 19:15:03.103287	Qui repudiandae enim non aliquam necessitatibus nulla nihil.
Angelita.Hammes	$2b$04$BggT21SH6dVET9BTnhxySeTmOfS0bSECP7acQi17mdjb9HpSH56Ki	https://s3.amazonaws.com/uifaces/faces/twitter/kolage/128.jpg	2020-09-22 19:21:12.125139	Beatae ratione ea voluptatem incidunt quia fugiat odit eum.
Rhoda98	$2b$04$egAJAFGwe8NXp7ZLlCwZ1eBuhCcwqP/y8640O66HuljUteWAZcB7C	https://s3.amazonaws.com/uifaces/faces/twitter/miguelmendes/128.jpg	2020-09-22 19:21:12.126804	Suscipit consequuntur alias.
Iva_Block61	$2b$04$953KRjUI5TevkZKoQUSY4uCYTRvf/UlQaMvjcCwziqygsD8gvZg5m	https://s3.amazonaws.com/uifaces/faces/twitter/mirfanqureshi/128.jpg	2020-09-22 19:21:12.130478	Ut amet officia nulla fuga.
Doris.Douglas71	$2b$04$MKmqX4B2xmhLJzYcV9U7bOF.WK9m557tDU8kZfnRcpTFgXHSy2/AK	https://s3.amazonaws.com/uifaces/faces/twitter/stevedesigner/128.jpg	2020-09-22 19:21:12.132161	Libero provident unde est nostrum perferendis ducimus et eum aut.
Johathan16	$2b$04$BJKh9thVxRf3et4R1ajzlOYPG3sUIF7CSznS2POWQEmsDmUogojYu	https://s3.amazonaws.com/uifaces/faces/twitter/bergmartin/128.jpg	2020-09-22 19:21:12.135593	Quia ducimus consequatur.
Green23	$2b$04$ibLzBvrFVMeuF9IaO4E3H.TrmHzFdqZMf6gr4bIUoQNhRUpb3yJWC	https://s3.amazonaws.com/uifaces/faces/twitter/r_garcia/128.jpg	2020-09-22 19:21:12.137204	Repellat voluptatibus aut.
Joey.Tremblay67	$2b$04$8A2Xv6gsU8x5wUhJkb.JX.9mUAum4DMH2wT2wD3F4wwM5GnAywSfK	https://s3.amazonaws.com/uifaces/faces/twitter/gmourier/128.jpg	2020-09-22 19:21:12.14048	Velit voluptate fugiat.
Jana_Collier	$2b$04$pfQ2ZaWfeJbdwvm0/ogeuOI8KSLPLBCu0FTm/1/JXKbG7eneQTygy	https://s3.amazonaws.com/uifaces/faces/twitter/jarjan/128.jpg	2020-09-22 19:21:12.142068	Alias ut laudantium qui consequatur dolores.
Abner.Ondricka	$2b$04$mmHA9T5SbBT6YOnIVqaey.dTnYqIWJ2ozBVsE0Y.3oCkScoXPfOBy	https://s3.amazonaws.com/uifaces/faces/twitter/emileboudeling/128.jpg	2020-09-22 19:21:12.14525	Sed sint consectetur.
Curt_Jerde	$2b$04$hgS1UnvrHoNMYnSp52q1p.47jAYZMGN48GNBRzbgg0Ha3YqY3QQfG	https://s3.amazonaws.com/uifaces/faces/twitter/lmjabreu/128.jpg	2020-09-22 19:21:12.146863	Ut perspiciatis delectus.
Olin_Huels	$2b$04$.JlpnU1CfKjaVqLm8Ye62uXgZatqHvIzC0Dlkk8u4xfRVbMFktI62	https://s3.amazonaws.com/uifaces/faces/twitter/danpliego/128.jpg	2020-09-22 19:21:12.15023	Quo recusandae iusto quis.
Althea.Crooks72	$2b$04$TwMu63i8/6dsfPoDFVQOw.HTIH5lYUVN1xm/UB3dmOf4bJcXJOiVy	https://s3.amazonaws.com/uifaces/faces/twitter/guiiipontes/128.jpg	2020-09-22 19:21:12.151899	Quia sunt optio numquam eum similique.
Joshua0	$2b$04$OcFP.TxfN6foj.QsPjoO9.HkzAPEadMgFW1dF09B2R26nErtmaXSW	https://s3.amazonaws.com/uifaces/faces/twitter/_yardenoon/128.jpg	2020-09-22 19:21:12.157177	Quia quae doloribus fugiat.
Elizabeth.Sawayn	$2b$04$gqNYEgsIZLqat.U9aS6GQ.8tUChOsfn31gl.4z/9j81ltKf9zPcOm	https://s3.amazonaws.com/uifaces/faces/twitter/ateneupopular/128.jpg	2020-09-22 19:21:12.158703	Sunt ullam non consequatur voluptatem exercitationem.
Aniya33	$2b$04$rvEg1kaoj.iYQSdz6NdOyOVQXV9i68nX2VztOSyFORbWNv/7drySy	https://s3.amazonaws.com/uifaces/faces/twitter/hermanobrother/128.jpg	2020-09-22 19:21:12.161954	Cupiditate quibusdam vel at amet.
Cristobal.Hickle	$2b$04$tO.G6w2Mq06/OHVBDCI6sOL5h9JXhPtxhYsU85Fs7d.ni4tSrApbm	https://s3.amazonaws.com/uifaces/faces/twitter/ateneupopular/128.jpg	2020-09-22 19:21:12.163608	Deleniti rerum doloribus voluptate dignissimos.
Dee86	$2b$04$nx52EI.ZyNGAMTMHTXG2YeSGdt.11Hn9II74t9lKM9ktvM2NQyu2e	https://s3.amazonaws.com/uifaces/faces/twitter/nellleo/128.jpg	2020-09-22 19:21:12.167647	Dolorem quidem aut tempore unde et.
Larry_Sawayn	$2b$04$v3tfpKE0APGTOEsBZLd..OHt50I4sEeFcLLkrPaur50uzaZ687Xdq	https://s3.amazonaws.com/uifaces/faces/twitter/tobysaxon/128.jpg	2020-09-22 19:21:12.169623	Repellendus sit soluta.
Hubert_Goodwin	$2b$04$LPV64tNsX9xwOKgOKeARhOyZSXXQz8NOivbdKAQiXNamAf0vcsFkG	https://s3.amazonaws.com/uifaces/faces/twitter/nckjrvs/128.jpg	2020-09-22 19:21:12.173094	Quaerat quibusdam recusandae nulla odit quo in ad et esse.
Kamren55	$2b$04$W8OTdhPHEfnL47uELCOlxOEjWmeDv12hu0r9gG/kz52iIweMfTPh2	https://s3.amazonaws.com/uifaces/faces/twitter/alagoon/128.jpg	2020-09-22 19:21:12.174767	Omnis vitae qui ullam dolorem pariatur et.
Naomie.Prosacco	$2b$04$gHYif9ew85SO0j1AR/YJeOdatBg3nMoaBSEuhv2PgD3GEpgHiXYDK	https://s3.amazonaws.com/uifaces/faces/twitter/daniloc/128.jpg	2020-09-22 19:21:12.17802	Quisquam et voluptatem soluta et delectus.
Oda28	$2b$04$jnCH5WNXQsxkna3SuIf37.dJ7unf0A2.21ZwRBJs4UyLGqwdCBbpC	https://s3.amazonaws.com/uifaces/faces/twitter/ralph_lam/128.jpg	2020-09-22 19:21:12.179588	Nulla commodi explicabo rerum sequi itaque dolorum.
Keegan_Prohaska	$2b$04$vNGeKoh2guqUDV8kfmfdU.0xU8mZpu4pOBBX62PhbwaMKiqxqC5E2	https://s3.amazonaws.com/uifaces/faces/twitter/_williamguerra/128.jpg	2020-09-22 19:21:11.812552	Repellat quia fugit velit porro dolores repellendus et quia sint.
Velda.OReilly24	$2b$04$EWHlj9V1Q7xR9mJEdNpj5uAgmYBeRZDWNTiKpUumEJ/YSDO1.t6ha	https://s3.amazonaws.com/uifaces/faces/twitter/saschamt/128.jpg	2020-09-22 19:21:11.817576	Fugiat id tempora corrupti necessitatibus blanditiis qui itaque quod.
Janelle_Howe68	$2b$04$FtbIJOd13j.mrYoRraE7kesbYXPWrakPTs10sZllrQcTkWotNtvdC	https://s3.amazonaws.com/uifaces/faces/twitter/ankitind/128.jpg	2020-09-22 19:21:11.878179	Omnis est asperiores.
Waino.Reilly9	$2b$04$i3BVoi45odE7tOYesVVzcud0csVe8xd7RTVbxJEOERc4EqUCdc/uS	https://s3.amazonaws.com/uifaces/faces/twitter/manigm/128.jpg	2020-09-22 19:21:11.89579	Aliquam vel neque dolores ea tempore doloremque qui.
Crystal_Balistreri	$2b$04$kJhWZDM7mH.eiqhzP6hckOh4ZUjArufM40lkRpFPG3vRb5Tf7l8Eq	https://s3.amazonaws.com/uifaces/faces/twitter/fabbrucci/128.jpg	2020-09-22 19:21:11.959855	Et in iure a debitis error perferendis sequi voluptas inventore.
Zechariah.Sipes55	$2b$04$Q2Tiju0kWRcACYGDLHs9qeebP//sd/0hZ.pl5ruMhjm02PFK736Ty	https://s3.amazonaws.com/uifaces/faces/twitter/jlsolerdeltoro/128.jpg	2020-09-22 19:21:12.004327	Et culpa similique et et ut illum quidem.
Callie.Rohan24	$2b$04$UHcZw9gUquun/gceX32BXOmwsbn4xSFHcOw1WeEedQm3M1oCvPnxC	https://s3.amazonaws.com/uifaces/faces/twitter/wikiziner/128.jpg	2020-09-22 19:21:12.063274	Sapiente omnis iusto esse rerum officiis.
Garett_Borer13	$2b$04$pyffaoetEZf.rvWHF2ErW.BTGTgVRrrlMslKTe7OfRx5FwDZ0ncHy	https://s3.amazonaws.com/uifaces/faces/twitter/zaki3d/128.jpg	2020-09-22 19:21:12.070193	Repudiandae qui suscipit sed amet quis iste deserunt ex eveniet.
Joyce_Heaney	$2b$04$TxNXedThTPjBslRZ7yoVp.oSwVtNz9i03bYGA5lienbdNfj4NcoZu	https://s3.amazonaws.com/uifaces/faces/twitter/praveen_vijaya/128.jpg	2020-09-22 19:21:12.123528	Et reiciendis tempore enim dolor quae corrupti ea ullam.
Robert88	$2b$04$DOY2AghLeJyG3MVVGdl0l.l4nCbzJnUQCibMv.J5YB3ZZC0hqQUf2	https://s3.amazonaws.com/uifaces/faces/twitter/buzzusborne/128.jpg	2020-09-22 19:21:12.153867	Quisquam in delectus ad doloribus a et rem est.
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.votes (post_id, username, value) FROM stdin;
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	routePY	1
c000d026-2e11-4d5d-b4aa-c533bf769016	routePY	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	routeP1	1
9f20d789-935c-4109-b05a-3077a29eb1df	fish_guy	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	chicken_guy	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	fish_guy	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	fish_guy	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	fish_guy	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	chicken_guy	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	chicken_guy	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	chicken_guy	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	fish_guy	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	fish_guy	1
c000d026-2e11-4d5d-b4aa-c533bf769016	chicken_guy	-1
9f20d789-935c-4109-b05a-3077a29eb1df	chicken_guy	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	fish_guy	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	routePY	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	fish_guy	1
99e91398-36df-496e-b4aa-97b6d77cbab1	fish_guy	1
c02a050c-9299-4313-b24d-d42a6c189505	fish_guy	1
8592ac88-a537-40f3-b024-c5b90b11a69d	fish_guy	-1
e3d32705-a4e8-4070-8224-442c946b05a8	fish_guy	1
eb9c21ab-a064-4de9-921d-c059814f81c7	fish_guy	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	fish_guy	1
98d76875-65d1-403b-9f65-e1b77fb25903	fish_guy	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	fish_guy	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	fish_guy	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	fish_guy	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	fish_guy	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	fish_guy	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	fish_guy	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	fish_guy	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	fish_guy	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	fish_guy	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	fish_guy	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	fish_guy	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	fish_guy	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	fish_guy	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	fish_guy	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	fish_guy	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	fish_guy	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	fish_guy	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	fish_guy	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	fish_guy	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	fish_guy	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	fish_guy	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	fish_guy	1
23c943e0-2ea7-42c7-9112-c77c08073122	fish_guy	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	fish_guy	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	fish_guy	1
c7594724-4e46-48bf-b545-dde115e92a96	fish_guy	1
93b57384-8822-4eee-89cc-64c16ed25a59	fish_guy	1
c000d026-2e11-4d5d-b4aa-c533bf769016	fish_guy	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	fish_guy	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	fish_guy	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	fish_guy	1
36858a27-3c56-46c8-af27-984828aebb98	fish_guy	1
fa22a469-463b-44c5-b0f0-63a24be82fef	fish_guy	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	fish_guy	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	fish_guy	1
96b2311c-d26f-4462-a29c-a94753161467	fish_guy	1
a78acc11-6874-4bff-96d4-29ae7974a05c	fish_guy	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	fish_guy	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	fish_guy	1
8f12c165-b18c-484b-b6e4-8de96add42f0	fish_guy	1
bf75a830-7874-44ca-ab46-275c273b4c76	fish_guy	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	chicken_guy	1
532a613b-9be2-43e4-82f4-ddce03d99630	fish_guy	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	fish_guy	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	fish_guy	1
ad98a18b-91de-4949-aba6-8c04c523dd81	fish_guy	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	fish_guy	1
821f91e3-915a-43dd-89a7-8df33e522565	fish_guy	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	fish_guy	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	fish_guy	1
020f3109-5d91-4cdc-936d-b60387e8f326	fish_guy	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	fish_guy	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	fish_guy	1
108e57ac-5c11-47db-a106-fc3963f7b58d	fish_guy	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	fish_guy	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	fish_guy	1
62978666-53c0-4edb-a671-19efd6e9457a	fish_guy	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	fish_guy	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	fish_guy	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	fish_guy	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	fish_guy	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	fish_guy	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	fish_guy	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	fish_guy	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	fish_guy	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	fish_guy	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	fish_guy	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	fish_guy	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	fish_guy	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	fish_guy	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	fish_guy	1
69199805-05c7-4301-8c05-868f29e606d6	fish_guy	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	fish_guy	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	fish_guy	-1
1d5c2502-ca57-4203-9271-bd342aca5648	fish_guy	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	fish_guy	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	fish_guy	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	fish_guy	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	fish_guy	-1
2508c094-ff79-4881-b756-74234df008f2	fish_guy	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	fish_guy	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	routePY	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	routePY	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	routePY	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	routePY	1
c02a050c-9299-4313-b24d-d42a6c189505	routePY	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	routePY	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	routePY	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	routePY	1
c7594724-4e46-48bf-b545-dde115e92a96	routePY	1
36858a27-3c56-46c8-af27-984828aebb98	routePY	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	routePY	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	routePY	1
eb9c21ab-a064-4de9-921d-c059814f81c7	routePY	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	routePY	1
e6030f49-4156-4c69-8aed-805cb4f8382a	routePY	1
96b2311c-d26f-4462-a29c-a94753161467	routePY	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	routePY	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	routePY	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	routePY	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	routePY	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	routePY	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	routePY	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	routePY	1
532a613b-9be2-43e4-82f4-ddce03d99630	routePY	1
fc65f17f-c071-4362-b9bd-4db4308da997	routePY	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	routePY	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	routePY	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	routePY	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	routePY	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	routePY	-1
98d76875-65d1-403b-9f65-e1b77fb25903	routePY	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	routePY	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	routePY	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	routePY	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	routePY	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	routePY	1
a78acc11-6874-4bff-96d4-29ae7974a05c	routePY	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	routePY	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	routePY	1
99e91398-36df-496e-b4aa-97b6d77cbab1	routePY	1
8f12c165-b18c-484b-b6e4-8de96add42f0	routePY	1
970eed6e-3a47-42a9-b90b-a3c049f96751	routePY	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	routePY	-1
93b57384-8822-4eee-89cc-64c16ed25a59	routePY	1
8592ac88-a537-40f3-b024-c5b90b11a69d	routePY	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	routePY	1
4ac2f167-736f-4f39-be81-2dbe63991d34	routePY	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	routePY	-1
9f20d789-935c-4109-b05a-3077a29eb1df	routePY	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	routePY	-1
7e73540b-772a-49d9-b5c1-49c000461d56	routePY	-1
eb43e6c6-b016-445c-b33c-05468d203319	routePY	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	routePY	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	routePY	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	routePY	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	routePY	-1
2508c094-ff79-4881-b756-74234df008f2	routePY	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	routePY	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	routePY	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	routePY	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	routePY	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	routePY	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	routePY	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	routePY	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	routePY	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	routePY	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	routePY	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	routePY	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	routePY	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	routePY	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	routePY	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	routePY	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	routeP1	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	routeP1	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	routeP1	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	routeP1	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	routeP1	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	routeP1	1
fa22a469-463b-44c5-b0f0-63a24be82fef	routeP1	1
821f91e3-915a-43dd-89a7-8df33e522565	routeP1	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	routeP1	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	routeP1	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	routeP1	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	routeP1	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	routeP1	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	routeP1	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	routeP1	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	routeP1	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	routeP1	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	routeP1	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	routeP1	1
62978666-53c0-4edb-a671-19efd6e9457a	routeP1	1
c02a050c-9299-4313-b24d-d42a6c189505	routeP1	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	routeP1	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	routeP1	1
ad98a18b-91de-4949-aba6-8c04c523dd81	routeP1	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	routeP1	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	routeP1	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	routeP1	1
a78acc11-6874-4bff-96d4-29ae7974a05c	routeP1	1
108e57ac-5c11-47db-a106-fc3963f7b58d	routeP1	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	routeP1	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	routeP1	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	routeP1	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	routeP1	1
1d5c2502-ca57-4203-9271-bd342aca5648	routeP1	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	routeP1	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	routeP1	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	routeP1	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	routeP1	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	routeP1	1
e6030f49-4156-4c69-8aed-805cb4f8382a	routeP1	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	routeP1	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	routeP1	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	routeP1	1
e3d32705-a4e8-4070-8224-442c946b05a8	routeP1	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	routeP1	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	routeP1	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	routeP1	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	routeP1	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	routeP1	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	routeP1	1
9f20d789-935c-4109-b05a-3077a29eb1df	routeP1	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	routeP1	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	routeP1	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	routeP1	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	routeP1	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	routeP1	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	routeP1	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	routeP1	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	routeP1	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	routeP1	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	routeP1	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	routeP1	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	routeP1	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	routeP1	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	routeP1	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	routeP1	-1
bf75a830-7874-44ca-ab46-275c273b4c76	routeP1	-1
2508c094-ff79-4881-b756-74234df008f2	routeP1	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	routeP1	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	routeP1	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	routeP1	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	routeP1	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	routeP1	-1
cb2730fa-9028-467f-905d-75c229ed9879	routeP1	-1
c7594724-4e46-48bf-b545-dde115e92a96	routeP1	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	routeP1	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	routeP1	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	routeP1	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Velva.Lebsack	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Velva.Lebsack	1
93b57384-8822-4eee-89cc-64c16ed25a59	Velva.Lebsack	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Velva.Lebsack	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Velva.Lebsack	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Velva.Lebsack	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Velva.Lebsack	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Velva.Lebsack	1
98d76875-65d1-403b-9f65-e1b77fb25903	Velva.Lebsack	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Velva.Lebsack	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Velva.Lebsack	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Velva.Lebsack	1
eb43e6c6-b016-445c-b33c-05468d203319	Velva.Lebsack	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Velva.Lebsack	1
bf75a830-7874-44ca-ab46-275c273b4c76	Velva.Lebsack	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Velva.Lebsack	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Velva.Lebsack	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Velva.Lebsack	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Velva.Lebsack	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Velva.Lebsack	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Velva.Lebsack	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Velva.Lebsack	1
9f20d789-935c-4109-b05a-3077a29eb1df	Velva.Lebsack	1
fc65f17f-c071-4362-b9bd-4db4308da997	Velva.Lebsack	1
1d5c2502-ca57-4203-9271-bd342aca5648	Velva.Lebsack	1
cb2730fa-9028-467f-905d-75c229ed9879	Velva.Lebsack	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Velva.Lebsack	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Velva.Lebsack	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Velva.Lebsack	1
532a613b-9be2-43e4-82f4-ddce03d99630	Velva.Lebsack	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Velva.Lebsack	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Velva.Lebsack	-1
96b2311c-d26f-4462-a29c-a94753161467	Velva.Lebsack	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Velva.Lebsack	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Velva.Lebsack	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Velva.Lebsack	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Velva.Lebsack	1
2508c094-ff79-4881-b756-74234df008f2	Velva.Lebsack	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Velva.Lebsack	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Velva.Lebsack	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Velva.Lebsack	1
69199805-05c7-4301-8c05-868f29e606d6	Velva.Lebsack	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Velva.Lebsack	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Velva.Lebsack	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Velva.Lebsack	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Velva.Lebsack	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Velva.Lebsack	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Velva.Lebsack	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Velva.Lebsack	1
fa22a469-463b-44c5-b0f0-63a24be82fef	chicken_guy	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Velva.Lebsack	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Velva.Lebsack	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Velva.Lebsack	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Velva.Lebsack	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Velva.Lebsack	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Velva.Lebsack	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Velva.Lebsack	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Velva.Lebsack	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Velva.Lebsack	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Velva.Lebsack	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Velva.Lebsack	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	chicken_guy	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Velva.Lebsack	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Velva.Lebsack	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Velva.Lebsack	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Velva.Lebsack	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Velva.Lebsack	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Velva.Lebsack	-1
36858a27-3c56-46c8-af27-984828aebb98	Velva.Lebsack	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Velva.Lebsack	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Velva.Lebsack	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Velva.Lebsack	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Velva.Lebsack	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Velva.Lebsack	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Velva.Lebsack	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Velva.Lebsack	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Velva.Lebsack	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Velva.Lebsack	-1
c02a050c-9299-4313-b24d-d42a6c189505	Velva.Lebsack	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	chicken_guy	1
c7594724-4e46-48bf-b545-dde115e92a96	chicken_guy	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	chicken_guy	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	chicken_guy	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	chicken_guy	1
4ac2f167-736f-4f39-be81-2dbe63991d34	chicken_guy	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	chicken_guy	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	chicken_guy	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	chicken_guy	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	chicken_guy	1
020f3109-5d91-4cdc-936d-b60387e8f326	chicken_guy	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	chicken_guy	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	chicken_guy	1
e6030f49-4156-4c69-8aed-805cb4f8382a	chicken_guy	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	chicken_guy	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	chicken_guy	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	chicken_guy	1
23c943e0-2ea7-42c7-9112-c77c08073122	chicken_guy	1
108e57ac-5c11-47db-a106-fc3963f7b58d	chicken_guy	-1
532a613b-9be2-43e4-82f4-ddce03d99630	chicken_guy	1
2508c094-ff79-4881-b756-74234df008f2	chicken_guy	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	chicken_guy	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	chicken_guy	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	chicken_guy	1
cb2730fa-9028-467f-905d-75c229ed9879	chicken_guy	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	chicken_guy	1
8592ac88-a537-40f3-b024-c5b90b11a69d	chicken_guy	1
71987b86-bbec-457b-a2d9-c1b3257dd876	chicken_guy	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	chicken_guy	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	chicken_guy	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	chicken_guy	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	chicken_guy	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	chicken_guy	1
1d5c2502-ca57-4203-9271-bd342aca5648	chicken_guy	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	chicken_guy	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	chicken_guy	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	chicken_guy	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	chicken_guy	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	chicken_guy	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	chicken_guy	1
98d76875-65d1-403b-9f65-e1b77fb25903	chicken_guy	1
99e91398-36df-496e-b4aa-97b6d77cbab1	chicken_guy	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	chicken_guy	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	chicken_guy	1
eb43e6c6-b016-445c-b33c-05468d203319	chicken_guy	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	chicken_guy	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	chicken_guy	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	chicken_guy	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	chicken_guy	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	chicken_guy	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	chicken_guy	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	chicken_guy	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	chicken_guy	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	chicken_guy	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	chicken_guy	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	chicken_guy	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	chicken_guy	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	chicken_guy	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	chicken_guy	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	chicken_guy	-1
7e73540b-772a-49d9-b5c1-49c000461d56	chicken_guy	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	chicken_guy	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	chicken_guy	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	chicken_guy	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Carlee.Runolfsson	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Carlee.Runolfsson	1
69199805-05c7-4301-8c05-868f29e606d6	Carlee.Runolfsson	1
c7594724-4e46-48bf-b545-dde115e92a96	Carlee.Runolfsson	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Carlee.Runolfsson	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Carlee.Runolfsson	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Carlee.Runolfsson	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Carlee.Runolfsson	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Carlee.Runolfsson	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Carlee.Runolfsson	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Carlee.Runolfsson	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Carlee.Runolfsson	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Carlee.Runolfsson	1
23c943e0-2ea7-42c7-9112-c77c08073122	Carlee.Runolfsson	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Carlee.Runolfsson	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Carlee.Runolfsson	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Carlee.Runolfsson	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Carlee.Runolfsson	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Carlee.Runolfsson	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Carlee.Runolfsson	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Carlee.Runolfsson	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Carlee.Runolfsson	1
9f20d789-935c-4109-b05a-3077a29eb1df	Carlee.Runolfsson	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Carlee.Runolfsson	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Carlee.Runolfsson	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Carlee.Runolfsson	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Carlee.Runolfsson	1
93b57384-8822-4eee-89cc-64c16ed25a59	Carlee.Runolfsson	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Carlee.Runolfsson	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Carlee.Runolfsson	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Carlee.Runolfsson	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Carlee.Runolfsson	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Carlee.Runolfsson	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Carlee.Runolfsson	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Carlee.Runolfsson	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Carlee.Runolfsson	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Carlee.Runolfsson	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Carlee.Runolfsson	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Carlee.Runolfsson	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Carlee.Runolfsson	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Carlee.Runolfsson	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Carlee.Runolfsson	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Carlee.Runolfsson	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Carlee.Runolfsson	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Carlee.Runolfsson	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Carlee.Runolfsson	1
821f91e3-915a-43dd-89a7-8df33e522565	Carlee.Runolfsson	1
532a613b-9be2-43e4-82f4-ddce03d99630	Carlee.Runolfsson	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Carlee.Runolfsson	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Carlee.Runolfsson	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Carlee.Runolfsson	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Carlee.Runolfsson	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Carlee.Runolfsson	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Carlee.Runolfsson	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Carlee.Runolfsson	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Carlee.Runolfsson	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Carlee.Runolfsson	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Carlee.Runolfsson	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Carlee.Runolfsson	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Carlee.Runolfsson	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Carlee.Runolfsson	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Carlee.Runolfsson	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Carlee.Runolfsson	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Carlee.Runolfsson	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Carlee.Runolfsson	-1
2508c094-ff79-4881-b756-74234df008f2	Carlee.Runolfsson	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Carlee.Runolfsson	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Carlee.Runolfsson	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Carlee.Runolfsson	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Carlee.Runolfsson	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Carlee.Runolfsson	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Carlee.Runolfsson	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Carlee.Runolfsson	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Rosalia.Aufderhar57	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Rosalia.Aufderhar57	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Rosalia.Aufderhar57	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Rosalia.Aufderhar57	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Rosalia.Aufderhar57	1
c02a050c-9299-4313-b24d-d42a6c189505	Rosalia.Aufderhar57	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Rosalia.Aufderhar57	1
23c943e0-2ea7-42c7-9112-c77c08073122	Rosalia.Aufderhar57	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Rosalia.Aufderhar57	1
96b2311c-d26f-4462-a29c-a94753161467	Rosalia.Aufderhar57	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Rosalia.Aufderhar57	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Rosalia.Aufderhar57	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Rosalia.Aufderhar57	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Rosalia.Aufderhar57	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Rosalia.Aufderhar57	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Rosalia.Aufderhar57	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Rosalia.Aufderhar57	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Rosalia.Aufderhar57	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Rosalia.Aufderhar57	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Rosalia.Aufderhar57	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Rosalia.Aufderhar57	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Rosalia.Aufderhar57	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Rosalia.Aufderhar57	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Rosalia.Aufderhar57	1
93b57384-8822-4eee-89cc-64c16ed25a59	Rosalia.Aufderhar57	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Rosalia.Aufderhar57	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Rosalia.Aufderhar57	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Rosalia.Aufderhar57	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Rosalia.Aufderhar57	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Rosalia.Aufderhar57	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Rosalia.Aufderhar57	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Rosalia.Aufderhar57	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Rosalia.Aufderhar57	1
821f91e3-915a-43dd-89a7-8df33e522565	Rosalia.Aufderhar57	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Rosalia.Aufderhar57	1
532a613b-9be2-43e4-82f4-ddce03d99630	Rosalia.Aufderhar57	1
c7594724-4e46-48bf-b545-dde115e92a96	Rosalia.Aufderhar57	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Rosalia.Aufderhar57	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Rosalia.Aufderhar57	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Rosalia.Aufderhar57	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Rosalia.Aufderhar57	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Rosalia.Aufderhar57	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Rosalia.Aufderhar57	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Rosalia.Aufderhar57	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Rosalia.Aufderhar57	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Rosalia.Aufderhar57	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Rosalia.Aufderhar57	-1
cb2730fa-9028-467f-905d-75c229ed9879	Rosalia.Aufderhar57	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Rosalia.Aufderhar57	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Rosalia.Aufderhar57	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Rosalia.Aufderhar57	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Rosalia.Aufderhar57	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Rosalia.Aufderhar57	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Rosalia.Aufderhar57	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Rosalia.Aufderhar57	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Rosalia.Aufderhar57	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Rosalia.Aufderhar57	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Rosalia.Aufderhar57	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Rosalia.Aufderhar57	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Rosalia.Aufderhar57	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Rosalia.Aufderhar57	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Rosalia.Aufderhar57	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Rosalia.Aufderhar57	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Rosalia.Aufderhar57	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Rosalia.Aufderhar57	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Rosalia.Aufderhar57	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Rosalia.Aufderhar57	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Rosalia.Aufderhar57	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Rosalia.Aufderhar57	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Rosalia.Aufderhar57	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Rosalia.Aufderhar57	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Eino_Hayes46	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Eino_Hayes46	1
36858a27-3c56-46c8-af27-984828aebb98	Eino_Hayes46	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Eino_Hayes46	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Eino_Hayes46	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Eino_Hayes46	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Eino_Hayes46	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Eino_Hayes46	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Eino_Hayes46	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Eino_Hayes46	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Eino_Hayes46	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Eino_Hayes46	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Eino_Hayes46	1
96b2311c-d26f-4462-a29c-a94753161467	Eino_Hayes46	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Eino_Hayes46	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Eino_Hayes46	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Eino_Hayes46	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Eino_Hayes46	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Eino_Hayes46	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Eino_Hayes46	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Eino_Hayes46	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Eino_Hayes46	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Eino_Hayes46	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Eino_Hayes46	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Eino_Hayes46	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Eino_Hayes46	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Eino_Hayes46	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Eino_Hayes46	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Eino_Hayes46	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Eino_Hayes46	1
e3d32705-a4e8-4070-8224-442c946b05a8	Eino_Hayes46	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Eino_Hayes46	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Eino_Hayes46	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Eino_Hayes46	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Eino_Hayes46	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Eino_Hayes46	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Eino_Hayes46	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Eino_Hayes46	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Wilford_Hand	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Eino_Hayes46	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Eino_Hayes46	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Eino_Hayes46	1
93b57384-8822-4eee-89cc-64c16ed25a59	Eino_Hayes46	1
bf75a830-7874-44ca-ab46-275c273b4c76	Eino_Hayes46	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Eino_Hayes46	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Eino_Hayes46	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Eino_Hayes46	1
98d76875-65d1-403b-9f65-e1b77fb25903	Eino_Hayes46	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Eino_Hayes46	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Eino_Hayes46	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Wilford_Hand	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Eino_Hayes46	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Eino_Hayes46	-1
c7594724-4e46-48bf-b545-dde115e92a96	Eino_Hayes46	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Eino_Hayes46	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Eino_Hayes46	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Eino_Hayes46	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Eino_Hayes46	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Eino_Hayes46	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Eino_Hayes46	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Eino_Hayes46	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Eino_Hayes46	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Eino_Hayes46	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Eino_Hayes46	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Eino_Hayes46	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Eino_Hayes46	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Eino_Hayes46	-1
cb2730fa-9028-467f-905d-75c229ed9879	Eino_Hayes46	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Eino_Hayes46	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Eino_Hayes46	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Eino_Hayes46	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Eino_Hayes46	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Eino_Hayes46	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Eino_Hayes46	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Eino_Hayes46	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Eino_Hayes46	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Wilford_Hand	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Wilford_Hand	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Wilford_Hand	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Wilford_Hand	1
c7594724-4e46-48bf-b545-dde115e92a96	Wilford_Hand	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Wilford_Hand	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Wilford_Hand	1
020f3109-5d91-4cdc-936d-b60387e8f326	Wilford_Hand	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Wilford_Hand	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Wilford_Hand	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Wilford_Hand	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Wilford_Hand	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Wilford_Hand	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Wilford_Hand	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Wilford_Hand	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Wilford_Hand	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Wilford_Hand	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Wilford_Hand	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Wilford_Hand	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Wilford_Hand	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Wilford_Hand	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Wilford_Hand	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Wilford_Hand	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Wilford_Hand	1
821f91e3-915a-43dd-89a7-8df33e522565	Wilford_Hand	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Wilford_Hand	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Wilford_Hand	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Wilford_Hand	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Wilford_Hand	1
1d5c2502-ca57-4203-9271-bd342aca5648	Wilford_Hand	1
c02a050c-9299-4313-b24d-d42a6c189505	Wilford_Hand	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Wilford_Hand	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Wilford_Hand	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Wilford_Hand	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Wilford_Hand	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Wilford_Hand	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Wilford_Hand	1
23c943e0-2ea7-42c7-9112-c77c08073122	Wilford_Hand	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Wilford_Hand	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Wilford_Hand	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Wilford_Hand	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Wilford_Hand	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Wilford_Hand	1
36858a27-3c56-46c8-af27-984828aebb98	Wilford_Hand	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Wilford_Hand	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Wilford_Hand	1
69199805-05c7-4301-8c05-868f29e606d6	Wilford_Hand	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Wilford_Hand	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Wilford_Hand	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Wilford_Hand	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Wilford_Hand	-1
2508c094-ff79-4881-b756-74234df008f2	Wilford_Hand	-1
eb43e6c6-b016-445c-b33c-05468d203319	Wilford_Hand	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Wilford_Hand	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Wilford_Hand	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Wilford_Hand	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Wilford_Hand	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Wilford_Hand	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Wilford_Hand	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Wilford_Hand	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Wilford_Hand	-1
96b2311c-d26f-4462-a29c-a94753161467	Wilford_Hand	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Wilford_Hand	-1
cb2730fa-9028-467f-905d-75c229ed9879	Wilford_Hand	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Wilford_Hand	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Wilford_Hand	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Wilford_Hand	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Wilford_Hand	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Wilford_Hand	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Wilford_Hand	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Wilford_Hand	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Maverick63	1
e3d32705-a4e8-4070-8224-442c946b05a8	Maverick63	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Maverick63	1
970eed6e-3a47-42a9-b90b-a3c049f96751	fish_guy	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Maverick63	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Maverick63	1
bf75a830-7874-44ca-ab46-275c273b4c76	Maverick63	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Maverick63	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Maverick63	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Maverick63	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Maverick63	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Maverick63	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Maverick63	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Maverick63	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Maverick63	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Maverick63	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Maverick63	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Maverick63	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Maverick63	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Maverick63	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Maverick63	1
1d5c2502-ca57-4203-9271-bd342aca5648	Maverick63	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Maverick63	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Maverick63	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Maverick63	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Maverick63	1
c02a050c-9299-4313-b24d-d42a6c189505	Maverick63	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Maverick63	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Maverick63	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Maverick63	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Maverick63	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Maverick63	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Maverick63	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Maverick63	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Maverick63	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Maverick63	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Maverick63	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Maverick63	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Maverick63	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Maverick63	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Maverick63	1
7e73540b-772a-49d9-b5c1-49c000461d56	Maverick63	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Karley.Klocko63	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Maverick63	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Maverick63	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Maverick63	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Maverick63	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Karley.Klocko63	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Maverick63	1
cb2730fa-9028-467f-905d-75c229ed9879	Maverick63	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Maverick63	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Maverick63	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Maverick63	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Maverick63	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Maverick63	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Maverick63	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Maverick63	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Maverick63	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Maverick63	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Maverick63	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Maverick63	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Maverick63	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Maverick63	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Maverick63	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Maverick63	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Maverick63	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Maverick63	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Maverick63	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Maverick63	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Maverick63	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Maverick63	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Maverick63	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Maverick63	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Maverick63	-1
62978666-53c0-4edb-a671-19efd6e9457a	Maverick63	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Maverick63	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Maverick63	-1
36858a27-3c56-46c8-af27-984828aebb98	Maverick63	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Maverick63	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Karley.Klocko63	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Karley.Klocko63	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Karley.Klocko63	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Karley.Klocko63	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Karley.Klocko63	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Karley.Klocko63	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Karley.Klocko63	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Karley.Klocko63	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Karley.Klocko63	-1
cb2730fa-9028-467f-905d-75c229ed9879	Karley.Klocko63	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Karley.Klocko63	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Karley.Klocko63	1
9f20d789-935c-4109-b05a-3077a29eb1df	Karley.Klocko63	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Karley.Klocko63	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Karley.Klocko63	1
2508c094-ff79-4881-b756-74234df008f2	Karley.Klocko63	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Karley.Klocko63	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Karley.Klocko63	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Karley.Klocko63	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Karley.Klocko63	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Karley.Klocko63	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Karley.Klocko63	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Karley.Klocko63	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Karley.Klocko63	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Karley.Klocko63	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Karley.Klocko63	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Karley.Klocko63	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Karley.Klocko63	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Karley.Klocko63	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Karley.Klocko63	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Karley.Klocko63	1
c02a050c-9299-4313-b24d-d42a6c189505	Karley.Klocko63	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Karley.Klocko63	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Karley.Klocko63	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Karley.Klocko63	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Karley.Klocko63	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Karley.Klocko63	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Karley.Klocko63	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Karley.Klocko63	1
62978666-53c0-4edb-a671-19efd6e9457a	Karley.Klocko63	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Karley.Klocko63	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Karley.Klocko63	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Karley.Klocko63	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Karley.Klocko63	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Karley.Klocko63	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Karley.Klocko63	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Karley.Klocko63	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Karley.Klocko63	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Karley.Klocko63	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Karley.Klocko63	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Karley.Klocko63	1
69199805-05c7-4301-8c05-868f29e606d6	Karley.Klocko63	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Karley.Klocko63	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Karley.Klocko63	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Karley.Klocko63	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Karley.Klocko63	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Karley.Klocko63	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Karley.Klocko63	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Karley.Klocko63	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Karley.Klocko63	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Karley.Klocko63	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Karley.Klocko63	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Karley.Klocko63	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Karley.Klocko63	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Karley.Klocko63	-1
36858a27-3c56-46c8-af27-984828aebb98	Karley.Klocko63	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Karley.Klocko63	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Karley.Klocko63	-1
96b2311c-d26f-4462-a29c-a94753161467	Karley.Klocko63	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Karley.Klocko63	-1
821f91e3-915a-43dd-89a7-8df33e522565	Karley.Klocko63	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Karley.Klocko63	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Gail71	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Gail71	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Gail71	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Gail71	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	fish_guy	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Gail71	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Gail71	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Gail71	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Gail71	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Gail71	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Gail71	1
98d76875-65d1-403b-9f65-e1b77fb25903	Gail71	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Gail71	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Gail71	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Gail71	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Gail71	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Gail71	1
821f91e3-915a-43dd-89a7-8df33e522565	Gail71	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Gail71	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Gail71	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Gail71	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Gail71	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Gail71	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Gail71	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Gail71	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Gail71	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Gail71	1
020f3109-5d91-4cdc-936d-b60387e8f326	Gail71	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Gail71	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Gail71	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Gail71	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Gail71	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Gail71	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Gail71	1
23c943e0-2ea7-42c7-9112-c77c08073122	Gail71	-1
c02a050c-9299-4313-b24d-d42a6c189505	Gail71	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Gail71	1
bf75a830-7874-44ca-ab46-275c273b4c76	Gail71	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Gail71	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Gail71	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Gail71	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Gail71	1
c7594724-4e46-48bf-b545-dde115e92a96	Gail71	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Gail71	-1
cb2730fa-9028-467f-905d-75c229ed9879	Gail71	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Gail71	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Gail71	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Gail71	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Gail71	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Gail71	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Gail71	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Gail71	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Gail71	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Gail71	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Gail71	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Gail71	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Gail71	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Gail71	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Gail71	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Gail71	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Gail71	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Gail71	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Gail71	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Gail71	-1
96b2311c-d26f-4462-a29c-a94753161467	Gail71	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Gail71	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Gail71	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Gail71	-1
69199805-05c7-4301-8c05-868f29e606d6	Gail71	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Gail71	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Gail71	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Gail71	-1
eb43e6c6-b016-445c-b33c-05468d203319	Gail71	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Gail71	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Gail71	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Gail71	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Gail71	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Guillermo76	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Guillermo76	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Guillermo76	-1
62978666-53c0-4edb-a671-19efd6e9457a	Guillermo76	1
532a613b-9be2-43e4-82f4-ddce03d99630	Guillermo76	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Guillermo76	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Guillermo76	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Guillermo76	1
fc65f17f-c071-4362-b9bd-4db4308da997	Guillermo76	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Guillermo76	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Guillermo76	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Guillermo76	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Guillermo76	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Guillermo76	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Guillermo76	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Guillermo76	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Guillermo76	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Guillermo76	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Guillermo76	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Guillermo76	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Guillermo76	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Guillermo76	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Guillermo76	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Guillermo76	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Guillermo76	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Guillermo76	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Guillermo76	1
36858a27-3c56-46c8-af27-984828aebb98	Guillermo76	1
eb43e6c6-b016-445c-b33c-05468d203319	Guillermo76	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Guillermo76	1
1d5c2502-ca57-4203-9271-bd342aca5648	Guillermo76	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Guillermo76	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Guillermo76	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Guillermo76	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Guillermo76	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Guillermo76	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Guillermo76	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Guillermo76	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Guillermo76	1
23c943e0-2ea7-42c7-9112-c77c08073122	Guillermo76	1
2508c094-ff79-4881-b756-74234df008f2	Guillermo76	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Guillermo76	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Guillermo76	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Guillermo76	1
96b2311c-d26f-4462-a29c-a94753161467	Guillermo76	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Guillermo76	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Guillermo76	-1
821f91e3-915a-43dd-89a7-8df33e522565	Guillermo76	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Guillermo76	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Guillermo76	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Guillermo76	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Guillermo76	-1
cb2730fa-9028-467f-905d-75c229ed9879	Guillermo76	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Guillermo76	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Guillermo76	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Sibyl17	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Guillermo76	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Guillermo76	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Guillermo76	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Guillermo76	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Guillermo76	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Guillermo76	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Guillermo76	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Guillermo76	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Guillermo76	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Guillermo76	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Guillermo76	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Guillermo76	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Guillermo76	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Guillermo76	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Guillermo76	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Guillermo76	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Guillermo76	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Sibyl17	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Sibyl17	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Sibyl17	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Sibyl17	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Sibyl17	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Sibyl17	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Sibyl17	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Sibyl17	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Sibyl17	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Sibyl17	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Sibyl17	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Sibyl17	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Sibyl17	-1
2508c094-ff79-4881-b756-74234df008f2	Sibyl17	1
bf75a830-7874-44ca-ab46-275c273b4c76	Sibyl17	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Sibyl17	1
cb2730fa-9028-467f-905d-75c229ed9879	Sibyl17	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Sibyl17	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Sibyl17	-1
c7594724-4e46-48bf-b545-dde115e92a96	Sibyl17	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Sibyl17	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Sibyl17	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Sibyl17	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Sibyl17	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Sibyl17	1
23c943e0-2ea7-42c7-9112-c77c08073122	Sibyl17	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Sibyl17	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Sibyl17	1
9f20d789-935c-4109-b05a-3077a29eb1df	Sibyl17	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Sibyl17	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Sibyl17	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Sibyl17	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Sibyl17	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Sibyl17	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Sibyl17	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Sibyl17	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Sibyl17	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Sibyl17	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Sibyl17	1
c02a050c-9299-4313-b24d-d42a6c189505	Sibyl17	1
e3d32705-a4e8-4070-8224-442c946b05a8	Sibyl17	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Sibyl17	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Sibyl17	1
7e73540b-772a-49d9-b5c1-49c000461d56	Sibyl17	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Sibyl17	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Sibyl17	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Sibyl17	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Sibyl17	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Sibyl17	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Sibyl17	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Sibyl17	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Sibyl17	-1
69199805-05c7-4301-8c05-868f29e606d6	Sibyl17	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Sibyl17	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Sibyl17	-1
96b2311c-d26f-4462-a29c-a94753161467	Sibyl17	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Sibyl17	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Sibyl17	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Sibyl17	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Sibyl17	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Sibyl17	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Sibyl17	-1
eb43e6c6-b016-445c-b33c-05468d203319	Sibyl17	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Sibyl17	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Sibyl17	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Sibyl17	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Sibyl17	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Sibyl17	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Sibyl17	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Sibyl17	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Sibyl17	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Sibyl17	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Sibyl17	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Sibyl17	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Sibyl17	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Sibyl17	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Sibyl17	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Lola_Rempel20	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Lola_Rempel20	1
020f3109-5d91-4cdc-936d-b60387e8f326	Lola_Rempel20	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Lola_Rempel20	1
c7594724-4e46-48bf-b545-dde115e92a96	Lola_Rempel20	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Lola_Rempel20	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Lola_Rempel20	1
821f91e3-915a-43dd-89a7-8df33e522565	Lola_Rempel20	1
23c943e0-2ea7-42c7-9112-c77c08073122	Lola_Rempel20	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Lola_Rempel20	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Lola_Rempel20	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Lola_Rempel20	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Lola_Rempel20	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Lola_Rempel20	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Lola_Rempel20	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Lola_Rempel20	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Lola_Rempel20	1
9f20d789-935c-4109-b05a-3077a29eb1df	Lola_Rempel20	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Lola_Rempel20	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Lola_Rempel20	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Lola_Rempel20	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Lola_Rempel20	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Lola_Rempel20	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Lola_Rempel20	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Lola_Rempel20	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Lola_Rempel20	1
98d76875-65d1-403b-9f65-e1b77fb25903	Lola_Rempel20	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Lola_Rempel20	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Lola_Rempel20	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Lola_Rempel20	1
93b57384-8822-4eee-89cc-64c16ed25a59	Lola_Rempel20	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Lola_Rempel20	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Lola_Rempel20	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Lola_Rempel20	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Lola_Rempel20	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Lola_Rempel20	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Lola_Rempel20	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Lola_Rempel20	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Lola_Rempel20	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Lola_Rempel20	1
2508c094-ff79-4881-b756-74234df008f2	Lola_Rempel20	1
36858a27-3c56-46c8-af27-984828aebb98	Jayce_Connelly7	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Lola_Rempel20	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Lola_Rempel20	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Lola_Rempel20	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Lola_Rempel20	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Lola_Rempel20	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Lola_Rempel20	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Lola_Rempel20	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Lola_Rempel20	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Lola_Rempel20	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Lola_Rempel20	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Jayce_Connelly7	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Lola_Rempel20	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Lola_Rempel20	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Lola_Rempel20	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Lola_Rempel20	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Lola_Rempel20	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Lola_Rempel20	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Lola_Rempel20	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Lola_Rempel20	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Lola_Rempel20	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Jayce_Connelly7	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Lola_Rempel20	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Lola_Rempel20	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Lola_Rempel20	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Lola_Rempel20	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Lola_Rempel20	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Lola_Rempel20	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Lola_Rempel20	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Lola_Rempel20	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Jayce_Connelly7	1
69199805-05c7-4301-8c05-868f29e606d6	Jayce_Connelly7	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Jayce_Connelly7	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Jayce_Connelly7	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Jayce_Connelly7	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Jayce_Connelly7	1
1d5c2502-ca57-4203-9271-bd342aca5648	Jayce_Connelly7	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Jayce_Connelly7	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Jayce_Connelly7	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Jayce_Connelly7	1
e3d32705-a4e8-4070-8224-442c946b05a8	Jayce_Connelly7	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Jayce_Connelly7	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Jayce_Connelly7	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Jayce_Connelly7	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Jayce_Connelly7	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Jayce_Connelly7	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Jayce_Connelly7	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Jayce_Connelly7	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Jayce_Connelly7	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Jayce_Connelly7	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Jayce_Connelly7	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Jayce_Connelly7	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Jayce_Connelly7	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Jayce_Connelly7	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Jayce_Connelly7	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Jayce_Connelly7	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Jayce_Connelly7	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Jayce_Connelly7	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Jayce_Connelly7	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Jayce_Connelly7	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Jayce_Connelly7	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Jayce_Connelly7	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Jayce_Connelly7	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Jayce_Connelly7	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Jayce_Connelly7	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Jayce_Connelly7	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Jayce_Connelly7	-1
eb43e6c6-b016-445c-b33c-05468d203319	Jayce_Connelly7	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Jayce_Connelly7	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Jayce_Connelly7	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Jayce_Connelly7	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Jayce_Connelly7	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Jayce_Connelly7	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Jayce_Connelly7	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Jayce_Connelly7	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Jayce_Connelly7	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Jayce_Connelly7	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Jayce_Connelly7	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Jayce_Connelly7	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Jayce_Connelly7	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Jayce_Connelly7	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Jayce_Connelly7	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Jayce_Connelly7	1
9f20d789-935c-4109-b05a-3077a29eb1df	Jayce_Connelly7	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Jayce_Connelly7	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Jayce_Connelly7	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Jayce_Connelly7	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Jayce_Connelly7	1
c7594724-4e46-48bf-b545-dde115e92a96	Jayce_Connelly7	-1
821f91e3-915a-43dd-89a7-8df33e522565	Jayce_Connelly7	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Jayce_Connelly7	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Jayce_Connelly7	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Jayce_Connelly7	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Jayce_Connelly7	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Jayce_Connelly7	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Jayce_Connelly7	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Jayce_Connelly7	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Jayce_Connelly7	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Jayce_Connelly7	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Jayce_Connelly7	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Jayce_Connelly7	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	fish_guy	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Oren47	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Oren47	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Oren47	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Oren47	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Oren47	1
23c943e0-2ea7-42c7-9112-c77c08073122	Oren47	1
cb2730fa-9028-467f-905d-75c229ed9879	Oren47	1
36858a27-3c56-46c8-af27-984828aebb98	Oren47	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Oren47	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Oren47	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Oren47	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Oren47	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Oren47	1
bf75a830-7874-44ca-ab46-275c273b4c76	Oren47	1
e3d32705-a4e8-4070-8224-442c946b05a8	Oren47	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Oren47	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Oren47	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Oren47	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Oren47	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Oren47	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Oren47	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Oren47	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Oren47	1
93b57384-8822-4eee-89cc-64c16ed25a59	Oren47	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Oren47	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Oren47	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Oren47	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Oren47	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Oren47	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Oren47	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Oren47	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Oren47	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Oren47	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Oren47	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Oren47	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Oren47	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Oren47	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Oren47	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Oren47	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Oren47	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Oren47	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Oren47	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Oren47	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Oren47	1
98d76875-65d1-403b-9f65-e1b77fb25903	Oren47	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Oren47	1
821f91e3-915a-43dd-89a7-8df33e522565	Oren47	1
69199805-05c7-4301-8c05-868f29e606d6	Oren47	1
020f3109-5d91-4cdc-936d-b60387e8f326	Oren47	-1
62978666-53c0-4edb-a671-19efd6e9457a	Oren47	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Oren47	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Oren47	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Oren47	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Oren47	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Oren47	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Oren47	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Oren47	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Oren47	-1
96b2311c-d26f-4462-a29c-a94753161467	Oren47	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Oren47	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Oren47	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Oren47	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Oren47	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Oren47	-1
c7594724-4e46-48bf-b545-dde115e92a96	Oren47	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Oren47	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Oren47	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Oren47	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Oren47	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Oren47	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Oren47	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Oren47	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Oren47	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Oren47	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Oren47	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Oren47	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Oren47	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Oren47	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Oren47	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Oren47	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Leann42	1
c7594724-4e46-48bf-b545-dde115e92a96	Leann42	1
020f3109-5d91-4cdc-936d-b60387e8f326	Leann42	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Leann42	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Leann42	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Leann42	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Leann42	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Leann42	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Leann42	1
e3d32705-a4e8-4070-8224-442c946b05a8	Leann42	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Leann42	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Leann42	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Leann42	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Leann42	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Leann42	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Leann42	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Leann42	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Leann42	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Leann42	1
c02a050c-9299-4313-b24d-d42a6c189505	Leann42	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Leann42	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Leann42	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Leann42	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Leann42	1
821f91e3-915a-43dd-89a7-8df33e522565	Leann42	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Leann42	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Leann42	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Leann42	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Leann42	1
1d5c2502-ca57-4203-9271-bd342aca5648	Leann42	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Leann42	1
36858a27-3c56-46c8-af27-984828aebb98	Leann42	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Leann42	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Leann42	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Leann42	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Leann42	1
96b2311c-d26f-4462-a29c-a94753161467	Leann42	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Leann42	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Leann42	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Leann42	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Leann42	1
9f20d789-935c-4109-b05a-3077a29eb1df	Leann42	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Leann42	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Leann42	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Leann42	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Leann42	1
69199805-05c7-4301-8c05-868f29e606d6	Leann42	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Leann42	1
fc65f17f-c071-4362-b9bd-4db4308da997	Leann42	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Leann42	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Leann42	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Leann42	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Leann42	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Leann42	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Leann42	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Leann42	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Leann42	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Leann42	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Leann42	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Leann42	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Leann42	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Leann42	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Leann42	-1
eb43e6c6-b016-445c-b33c-05468d203319	Leann42	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Leann42	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Leann42	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Leann42	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Leann42	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Leann42	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Leann42	-1
62978666-53c0-4edb-a671-19efd6e9457a	Leann42	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Leann42	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Leann42	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Leann42	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Leann42	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Leann42	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Leann42	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Leann42	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Rey29	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Rey29	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Rey29	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Rey29	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Rey29	1
fc65f17f-c071-4362-b9bd-4db4308da997	Rey29	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Rey29	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Rey29	1
e3d32705-a4e8-4070-8224-442c946b05a8	Rey29	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Rey29	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Rey29	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Rey29	1
62978666-53c0-4edb-a671-19efd6e9457a	Rey29	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Rey29	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Rey29	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Rey29	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Rey29	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Rey29	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Rey29	1
c7594724-4e46-48bf-b545-dde115e92a96	Rey29	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Rey29	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Rey29	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Rey29	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Rey29	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Rey29	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Rey29	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Rey29	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Rey29	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Rey29	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Rey29	1
821f91e3-915a-43dd-89a7-8df33e522565	Rey29	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Rey29	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Rey29	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Rey29	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Rey29	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Rey29	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Maci.Thompson73	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Rey29	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Rey29	1
020f3109-5d91-4cdc-936d-b60387e8f326	Rey29	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Rey29	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Rey29	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Rey29	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Rey29	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Rey29	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Rey29	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Rey29	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Rey29	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Rey29	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Rey29	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Rey29	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Rey29	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Rey29	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Rey29	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Rey29	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Rey29	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Rey29	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Rey29	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Rey29	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Rey29	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Rey29	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Rey29	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Rey29	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Rey29	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Rey29	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Rey29	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Rey29	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Rey29	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Rey29	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Rey29	-1
c02a050c-9299-4313-b24d-d42a6c189505	Rey29	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Rey29	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Maci.Thompson73	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Maci.Thompson73	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Maci.Thompson73	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Maci.Thompson73	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Maci.Thompson73	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Maci.Thompson73	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Maci.Thompson73	1
9f20d789-935c-4109-b05a-3077a29eb1df	Maci.Thompson73	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Maci.Thompson73	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Maci.Thompson73	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Maci.Thompson73	1
532a613b-9be2-43e4-82f4-ddce03d99630	Maci.Thompson73	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Maci.Thompson73	1
1d5c2502-ca57-4203-9271-bd342aca5648	Maci.Thompson73	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Maci.Thompson73	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Maci.Thompson73	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Maci.Thompson73	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Maci.Thompson73	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Maci.Thompson73	-1
36858a27-3c56-46c8-af27-984828aebb98	Maci.Thompson73	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Maci.Thompson73	1
23c943e0-2ea7-42c7-9112-c77c08073122	Maci.Thompson73	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Maci.Thompson73	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Maci.Thompson73	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Maci.Thompson73	1
c7594724-4e46-48bf-b545-dde115e92a96	Maci.Thompson73	1
cb2730fa-9028-467f-905d-75c229ed9879	Maci.Thompson73	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Maci.Thompson73	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Maci.Thompson73	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Maci.Thompson73	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Maci.Thompson73	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Maci.Thompson73	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Maci.Thompson73	1
e3d32705-a4e8-4070-8224-442c946b05a8	Maci.Thompson73	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Maci.Thompson73	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Maci.Thompson73	-1
96b2311c-d26f-4462-a29c-a94753161467	Maci.Thompson73	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Maci.Thompson73	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Maci.Thompson73	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Maci.Thompson73	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Maci.Thompson73	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Maci.Thompson73	1
020f3109-5d91-4cdc-936d-b60387e8f326	Maci.Thompson73	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Maci.Thompson73	1
69199805-05c7-4301-8c05-868f29e606d6	Maci.Thompson73	1
98d76875-65d1-403b-9f65-e1b77fb25903	Maci.Thompson73	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Maci.Thompson73	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Maci.Thompson73	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Maci.Thompson73	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Maci.Thompson73	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Maci.Thompson73	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Maci.Thompson73	1
fc65f17f-c071-4362-b9bd-4db4308da997	Maci.Thompson73	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Maci.Thompson73	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Maci.Thompson73	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Maci.Thompson73	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Maci.Thompson73	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Maci.Thompson73	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Maci.Thompson73	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Maci.Thompson73	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Maci.Thompson73	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Maci.Thompson73	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Maci.Thompson73	-1
eb43e6c6-b016-445c-b33c-05468d203319	Maci.Thompson73	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Maci.Thompson73	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Maci.Thompson73	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Maci.Thompson73	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Maci.Thompson73	-1
821f91e3-915a-43dd-89a7-8df33e522565	Maci.Thompson73	-1
62978666-53c0-4edb-a671-19efd6e9457a	Maci.Thompson73	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Maci.Thompson73	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Maci.Thompson73	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Maci.Thompson73	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Maci.Thompson73	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Maci.Thompson73	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Haleigh_Farrell31	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Haleigh_Farrell31	1
c02a050c-9299-4313-b24d-d42a6c189505	Haleigh_Farrell31	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Haleigh_Farrell31	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Haleigh_Farrell31	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Haleigh_Farrell31	1
020f3109-5d91-4cdc-936d-b60387e8f326	Haleigh_Farrell31	1
eb43e6c6-b016-445c-b33c-05468d203319	Haleigh_Farrell31	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Haleigh_Farrell31	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Haleigh_Farrell31	1
36858a27-3c56-46c8-af27-984828aebb98	Haleigh_Farrell31	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Haleigh_Farrell31	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Haleigh_Farrell31	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Haleigh_Farrell31	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Haleigh_Farrell31	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Haleigh_Farrell31	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Haleigh_Farrell31	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Haleigh_Farrell31	1
1d5c2502-ca57-4203-9271-bd342aca5648	Haleigh_Farrell31	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Haleigh_Farrell31	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Haleigh_Farrell31	1
7e73540b-772a-49d9-b5c1-49c000461d56	Haleigh_Farrell31	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Haleigh_Farrell31	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Haleigh_Farrell31	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Haleigh_Farrell31	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Haleigh_Farrell31	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Haleigh_Farrell31	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Haleigh_Farrell31	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Haleigh_Farrell31	1
69199805-05c7-4301-8c05-868f29e606d6	Haleigh_Farrell31	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Haleigh_Farrell31	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Haleigh_Farrell31	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Haleigh_Farrell31	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Haleigh_Farrell31	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Haleigh_Farrell31	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Haleigh_Farrell31	1
cb2730fa-9028-467f-905d-75c229ed9879	Haleigh_Farrell31	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Haleigh_Farrell31	-1
821f91e3-915a-43dd-89a7-8df33e522565	Haleigh_Farrell31	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Haleigh_Farrell31	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Haleigh_Farrell31	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Haleigh_Farrell31	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Haleigh_Farrell31	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Haleigh_Farrell31	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Haleigh_Farrell31	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Haleigh_Farrell31	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Haleigh_Farrell31	1
23c943e0-2ea7-42c7-9112-c77c08073122	Haleigh_Farrell31	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Haleigh_Farrell31	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Haleigh_Farrell31	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Haleigh_Farrell31	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Haleigh_Farrell31	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Haleigh_Farrell31	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Haleigh_Farrell31	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Haleigh_Farrell31	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Hannah58	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Haleigh_Farrell31	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Haleigh_Farrell31	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Haleigh_Farrell31	-1
2508c094-ff79-4881-b756-74234df008f2	Haleigh_Farrell31	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Haleigh_Farrell31	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Haleigh_Farrell31	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Haleigh_Farrell31	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Haleigh_Farrell31	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Haleigh_Farrell31	-1
62978666-53c0-4edb-a671-19efd6e9457a	Haleigh_Farrell31	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Haleigh_Farrell31	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Haleigh_Farrell31	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Haleigh_Farrell31	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Haleigh_Farrell31	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Haleigh_Farrell31	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Haleigh_Farrell31	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Haleigh_Farrell31	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Hannah58	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Hannah58	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Hannah58	1
fc65f17f-c071-4362-b9bd-4db4308da997	Hannah58	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Hannah58	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Hannah58	1
36858a27-3c56-46c8-af27-984828aebb98	Hannah58	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Hannah58	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Hannah58	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Hannah58	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Hannah58	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Hannah58	1
96b2311c-d26f-4462-a29c-a94753161467	Hannah58	1
62978666-53c0-4edb-a671-19efd6e9457a	Hannah58	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Hannah58	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Hannah58	1
c7594724-4e46-48bf-b545-dde115e92a96	Hannah58	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Hannah58	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Hannah58	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Hannah58	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Hannah58	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Hannah58	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Hannah58	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Hannah58	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Hannah58	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Hannah58	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Hannah58	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Hannah58	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Hannah58	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Hannah58	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Hannah58	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Hannah58	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Hannah58	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Hannah58	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Hannah58	1
020f3109-5d91-4cdc-936d-b60387e8f326	Hannah58	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Hannah58	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Hannah58	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Hannah58	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Hannah58	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Hannah58	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Hannah58	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Hannah58	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Hannah58	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Hannah58	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Hannah58	-1
69199805-05c7-4301-8c05-868f29e606d6	Hannah58	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Hannah58	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Hannah58	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Hannah58	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Hannah58	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Hannah58	-1
2508c094-ff79-4881-b756-74234df008f2	Hannah58	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Hannah58	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Hannah58	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Hannah58	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Hannah58	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Hannah58	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Hannah58	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Hannah58	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Hannah58	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Hannah58	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Hannah58	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Hannah58	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Hannah58	-1
eb43e6c6-b016-445c-b33c-05468d203319	Hannah58	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Hannah58	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Hannah58	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Hannah58	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Hannah58	-1
c02a050c-9299-4313-b24d-d42a6c189505	Hannah58	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Hannah58	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Hannah58	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Hannah58	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Kirk_Bogisich49	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Kirk_Bogisich49	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Kirk_Bogisich49	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Kirk_Bogisich49	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Kirk_Bogisich49	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Kirk_Bogisich49	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Kirk_Bogisich49	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Kirk_Bogisich49	1
1d5c2502-ca57-4203-9271-bd342aca5648	Kirk_Bogisich49	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Kirk_Bogisich49	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Kirk_Bogisich49	1
36858a27-3c56-46c8-af27-984828aebb98	Kirk_Bogisich49	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Kirk_Bogisich49	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Kirk_Bogisich49	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Kirk_Bogisich49	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Kirk_Bogisich49	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Kirk_Bogisich49	-1
62978666-53c0-4edb-a671-19efd6e9457a	Kirk_Bogisich49	1
020f3109-5d91-4cdc-936d-b60387e8f326	Kirk_Bogisich49	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Kirk_Bogisich49	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Kirk_Bogisich49	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Kirk_Bogisich49	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Kirk_Bogisich49	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Kirk_Bogisich49	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Kirk_Bogisich49	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Joan43	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Kirk_Bogisich49	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Kirk_Bogisich49	1
69199805-05c7-4301-8c05-868f29e606d6	Kirk_Bogisich49	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Kirk_Bogisich49	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Kirk_Bogisich49	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Kirk_Bogisich49	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Kirk_Bogisich49	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Kirk_Bogisich49	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Kirk_Bogisich49	-1
821f91e3-915a-43dd-89a7-8df33e522565	Kirk_Bogisich49	-1
c7594724-4e46-48bf-b545-dde115e92a96	Kirk_Bogisich49	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Kirk_Bogisich49	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Kirk_Bogisich49	1
93b57384-8822-4eee-89cc-64c16ed25a59	Kirk_Bogisich49	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Kirk_Bogisich49	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Kirk_Bogisich49	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Kirk_Bogisich49	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Kirk_Bogisich49	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Kirk_Bogisich49	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Kirk_Bogisich49	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Kirk_Bogisich49	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Kirk_Bogisich49	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Kirk_Bogisich49	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Kirk_Bogisich49	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Kirk_Bogisich49	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Kirk_Bogisich49	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Kirk_Bogisich49	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Kirk_Bogisich49	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Kirk_Bogisich49	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Kirk_Bogisich49	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Kirk_Bogisich49	-1
96b2311c-d26f-4462-a29c-a94753161467	Kirk_Bogisich49	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Kirk_Bogisich49	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Kirk_Bogisich49	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Kirk_Bogisich49	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Kirk_Bogisich49	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Kirk_Bogisich49	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Kirk_Bogisich49	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Kirk_Bogisich49	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Kirk_Bogisich49	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Kirk_Bogisich49	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Kirk_Bogisich49	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Kirk_Bogisich49	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Joan43	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Kirk_Bogisich49	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Kirk_Bogisich49	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Kirk_Bogisich49	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Kirk_Bogisich49	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Joan43	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Kirk_Bogisich49	-1
69199805-05c7-4301-8c05-868f29e606d6	Joan43	1
36858a27-3c56-46c8-af27-984828aebb98	Joan43	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Joan43	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Joan43	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Joan43	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Joan43	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Joan43	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Joan43	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Joan43	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Joan43	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Joan43	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Joan43	1
96b2311c-d26f-4462-a29c-a94753161467	Joan43	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Joan43	1
bf75a830-7874-44ca-ab46-275c273b4c76	Joan43	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Joan43	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Joan43	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Joan43	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Joan43	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Joan43	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Joan43	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Joan43	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Joan43	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Joan43	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Joan43	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Joan43	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Joan43	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Joan43	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Joan43	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Joan43	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Joan43	1
1d5c2502-ca57-4203-9271-bd342aca5648	Joan43	1
c7594724-4e46-48bf-b545-dde115e92a96	Joan43	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Joan43	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Joan43	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Joan43	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Joan43	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Joan43	1
c02a050c-9299-4313-b24d-d42a6c189505	Joan43	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Joan43	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Joan43	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Joan43	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Joan43	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Joan43	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Joan43	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Joan43	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Joan43	-1
eb43e6c6-b016-445c-b33c-05468d203319	Joan43	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Joan43	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Joan43	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Joan43	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Joan43	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Joan43	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Joan43	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Joan43	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Joan43	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Joan43	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Joan43	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Joan43	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Joan43	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Joan43	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Joan43	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Joan43	-1
cb2730fa-9028-467f-905d-75c229ed9879	Joan43	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Joan43	-1
2508c094-ff79-4881-b756-74234df008f2	Joan43	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Joan43	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Joan43	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Joan43	-1
eb43e6c6-b016-445c-b33c-05468d203319	fish_guy	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	fish_guy	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	fish_guy	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	fish_guy	1
93b57384-8822-4eee-89cc-64c16ed25a59	Domenico_Williamson8	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Domenico_Williamson8	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Domenico_Williamson8	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Domenico_Williamson8	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Domenico_Williamson8	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Domenico_Williamson8	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Domenico_Williamson8	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Domenico_Williamson8	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Domenico_Williamson8	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Domenico_Williamson8	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Domenico_Williamson8	1
fc65f17f-c071-4362-b9bd-4db4308da997	Domenico_Williamson8	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Domenico_Williamson8	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Domenico_Williamson8	1
e3d32705-a4e8-4070-8224-442c946b05a8	Domenico_Williamson8	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Domenico_Williamson8	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Domenico_Williamson8	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Domenico_Williamson8	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Domenico_Williamson8	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Domenico_Williamson8	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Domenico_Williamson8	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Domenico_Williamson8	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Domenico_Williamson8	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Domenico_Williamson8	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Domenico_Williamson8	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Domenico_Williamson8	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Domenico_Williamson8	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Domenico_Williamson8	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Domenico_Williamson8	-1
2508c094-ff79-4881-b756-74234df008f2	Domenico_Williamson8	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Domenico_Williamson8	-1
36858a27-3c56-46c8-af27-984828aebb98	Domenico_Williamson8	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Domenico_Williamson8	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Domenico_Williamson8	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Domenico_Williamson8	1
69199805-05c7-4301-8c05-868f29e606d6	Domenico_Williamson8	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Domenico_Williamson8	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Domenico_Williamson8	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Domenico_Williamson8	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Morgan_Borer	1
cb2730fa-9028-467f-905d-75c229ed9879	Domenico_Williamson8	1
020f3109-5d91-4cdc-936d-b60387e8f326	Domenico_Williamson8	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Domenico_Williamson8	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Domenico_Williamson8	1
bf75a830-7874-44ca-ab46-275c273b4c76	Morgan_Borer	-1
eb43e6c6-b016-445c-b33c-05468d203319	Domenico_Williamson8	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Domenico_Williamson8	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Domenico_Williamson8	1
532a613b-9be2-43e4-82f4-ddce03d99630	Domenico_Williamson8	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Domenico_Williamson8	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Domenico_Williamson8	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Domenico_Williamson8	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Domenico_Williamson8	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Domenico_Williamson8	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Domenico_Williamson8	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Domenico_Williamson8	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Domenico_Williamson8	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Domenico_Williamson8	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Domenico_Williamson8	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Domenico_Williamson8	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Domenico_Williamson8	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Domenico_Williamson8	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Domenico_Williamson8	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Domenico_Williamson8	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Domenico_Williamson8	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Domenico_Williamson8	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Domenico_Williamson8	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Domenico_Williamson8	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Morgan_Borer	1
96b2311c-d26f-4462-a29c-a94753161467	Domenico_Williamson8	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Domenico_Williamson8	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Domenico_Williamson8	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Domenico_Williamson8	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Domenico_Williamson8	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Domenico_Williamson8	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Morgan_Borer	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Morgan_Borer	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Morgan_Borer	1
62978666-53c0-4edb-a671-19efd6e9457a	Morgan_Borer	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Morgan_Borer	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Morgan_Borer	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Morgan_Borer	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Morgan_Borer	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Morgan_Borer	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Morgan_Borer	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Morgan_Borer	1
36858a27-3c56-46c8-af27-984828aebb98	Morgan_Borer	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Morgan_Borer	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Morgan_Borer	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Morgan_Borer	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Morgan_Borer	1
cb2730fa-9028-467f-905d-75c229ed9879	Morgan_Borer	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Morgan_Borer	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Morgan_Borer	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Morgan_Borer	1
23c943e0-2ea7-42c7-9112-c77c08073122	Morgan_Borer	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Morgan_Borer	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Morgan_Borer	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Morgan_Borer	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Morgan_Borer	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Morgan_Borer	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Morgan_Borer	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Morgan_Borer	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Morgan_Borer	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Morgan_Borer	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Morgan_Borer	1
020f3109-5d91-4cdc-936d-b60387e8f326	Morgan_Borer	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Morgan_Borer	1
532a613b-9be2-43e4-82f4-ddce03d99630	Morgan_Borer	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Morgan_Borer	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Morgan_Borer	1
2508c094-ff79-4881-b756-74234df008f2	Morgan_Borer	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Morgan_Borer	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Morgan_Borer	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Morgan_Borer	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Morgan_Borer	1
eb43e6c6-b016-445c-b33c-05468d203319	Morgan_Borer	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Morgan_Borer	1
96b2311c-d26f-4462-a29c-a94753161467	Morgan_Borer	1
69199805-05c7-4301-8c05-868f29e606d6	Morgan_Borer	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Morgan_Borer	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Morgan_Borer	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Morgan_Borer	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Morgan_Borer	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Morgan_Borer	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Morgan_Borer	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Morgan_Borer	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Morgan_Borer	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Morgan_Borer	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Morgan_Borer	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Morgan_Borer	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Morgan_Borer	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Morgan_Borer	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Morgan_Borer	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Morgan_Borer	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Morgan_Borer	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Morgan_Borer	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Morgan_Borer	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Morgan_Borer	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Morgan_Borer	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Morgan_Borer	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Morgan_Borer	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Morgan_Borer	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Morgan_Borer	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Morgan_Borer	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Morgan_Borer	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Morgan_Borer	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Morgan_Borer	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Morgan_Borer	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Morgan_Borer	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Morgan_Borer	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	fish_guy	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Leta2	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Leta2	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Leta2	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Leta2	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Leta2	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Leta2	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Leta2	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Leta2	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Leta2	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Leta2	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Leta2	1
532a613b-9be2-43e4-82f4-ddce03d99630	Leta2	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Leta2	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Leta2	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Leta2	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Leta2	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Leta2	-1
c02a050c-9299-4313-b24d-d42a6c189505	Leta2	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Leta2	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Leta2	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Leta2	-1
62978666-53c0-4edb-a671-19efd6e9457a	Leta2	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Leta2	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Leta2	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Leta2	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Leta2	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Leta2	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Leta2	1
7e73540b-772a-49d9-b5c1-49c000461d56	Leta2	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Leta2	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Leta2	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Leta2	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Leta2	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Samanta46	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Leta2	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Leta2	1
93b57384-8822-4eee-89cc-64c16ed25a59	Leta2	1
bf75a830-7874-44ca-ab46-275c273b4c76	Leta2	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Leta2	1
eb43e6c6-b016-445c-b33c-05468d203319	Leta2	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Samanta46	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Leta2	1
cb2730fa-9028-467f-905d-75c229ed9879	Leta2	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Leta2	1
69199805-05c7-4301-8c05-868f29e606d6	Leta2	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Leta2	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Leta2	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Leta2	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Leta2	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Leta2	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Leta2	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Leta2	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Leta2	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Leta2	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Leta2	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Leta2	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Leta2	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Leta2	-1
96b2311c-d26f-4462-a29c-a94753161467	Leta2	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Leta2	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Leta2	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Leta2	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Leta2	-1
2508c094-ff79-4881-b756-74234df008f2	Leta2	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Leta2	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Leta2	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Leta2	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Leta2	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Leta2	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Leta2	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Leta2	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Leta2	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Samanta46	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Samanta46	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Samanta46	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Samanta46	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Samanta46	1
821f91e3-915a-43dd-89a7-8df33e522565	Samanta46	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Samanta46	1
e3d32705-a4e8-4070-8224-442c946b05a8	Samanta46	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Samanta46	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Samanta46	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Samanta46	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Samanta46	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Samanta46	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Samanta46	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Samanta46	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Samanta46	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Samanta46	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Samanta46	1
c02a050c-9299-4313-b24d-d42a6c189505	Samanta46	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Samanta46	1
c7594724-4e46-48bf-b545-dde115e92a96	Samanta46	1
36858a27-3c56-46c8-af27-984828aebb98	Samanta46	1
cb2730fa-9028-467f-905d-75c229ed9879	Samanta46	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Samanta46	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Samanta46	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Samanta46	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Samanta46	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Samanta46	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Samanta46	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Samanta46	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Samanta46	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Samanta46	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Samanta46	-1
69199805-05c7-4301-8c05-868f29e606d6	Samanta46	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Samanta46	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Samanta46	1
eb43e6c6-b016-445c-b33c-05468d203319	Samanta46	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Samanta46	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Samanta46	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Samanta46	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Samanta46	1
23c943e0-2ea7-42c7-9112-c77c08073122	Samanta46	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Samanta46	1
532a613b-9be2-43e4-82f4-ddce03d99630	Samanta46	1
bf75a830-7874-44ca-ab46-275c273b4c76	Samanta46	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Samanta46	1
96b2311c-d26f-4462-a29c-a94753161467	Samanta46	-1
2508c094-ff79-4881-b756-74234df008f2	Samanta46	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Samanta46	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Samanta46	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Samanta46	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Samanta46	-1
62978666-53c0-4edb-a671-19efd6e9457a	Samanta46	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Samanta46	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Samanta46	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Samanta46	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Samanta46	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Samanta46	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Samanta46	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Samanta46	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Samanta46	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Samanta46	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Samanta46	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Samanta46	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Samanta46	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Samanta46	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Samanta46	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Samanta46	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Samanta46	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Samanta46	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Cierra.Weissnat11	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Cierra.Weissnat11	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Cierra.Weissnat11	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Cierra.Weissnat11	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Cierra.Weissnat11	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Cierra.Weissnat11	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Cierra.Weissnat11	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Cierra.Weissnat11	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Cierra.Weissnat11	1
98d76875-65d1-403b-9f65-e1b77fb25903	Cierra.Weissnat11	1
93b57384-8822-4eee-89cc-64c16ed25a59	Cierra.Weissnat11	1
020f3109-5d91-4cdc-936d-b60387e8f326	Cierra.Weissnat11	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Cierra.Weissnat11	1
23c943e0-2ea7-42c7-9112-c77c08073122	Cierra.Weissnat11	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Cierra.Weissnat11	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Cierra.Weissnat11	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Cierra.Weissnat11	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Cierra.Weissnat11	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Cierra.Weissnat11	1
69199805-05c7-4301-8c05-868f29e606d6	Cierra.Weissnat11	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Cierra.Weissnat11	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Cierra.Weissnat11	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Cierra.Weissnat11	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Cierra.Weissnat11	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Cierra.Weissnat11	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Cierra.Weissnat11	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Cierra.Weissnat11	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Cierra.Weissnat11	1
96b2311c-d26f-4462-a29c-a94753161467	Cierra.Weissnat11	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Cierra.Weissnat11	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Cierra.Weissnat11	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Cierra.Weissnat11	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Cierra.Weissnat11	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Cierra.Weissnat11	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Cierra.Weissnat11	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Cierra.Weissnat11	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Cierra.Weissnat11	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Cierra.Weissnat11	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Cierra.Weissnat11	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Cierra.Weissnat11	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Cierra.Weissnat11	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Cierra.Weissnat11	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Cierra.Weissnat11	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Cierra.Weissnat11	1
2508c094-ff79-4881-b756-74234df008f2	Cierra.Weissnat11	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Cierra.Weissnat11	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Cierra.Weissnat11	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Cierra.Weissnat11	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Cierra.Weissnat11	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Cierra.Weissnat11	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Cierra.Weissnat11	-1
eb43e6c6-b016-445c-b33c-05468d203319	Cierra.Weissnat11	-1
c02a050c-9299-4313-b24d-d42a6c189505	Cierra.Weissnat11	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Cierra.Weissnat11	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Cierra.Weissnat11	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Cierra.Weissnat11	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Cierra.Weissnat11	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Cierra.Weissnat11	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Cierra.Weissnat11	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Cierra.Weissnat11	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Cierra.Weissnat11	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Cierra.Weissnat11	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Cierra.Weissnat11	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Cierra.Weissnat11	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Cierra.Weissnat11	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Cierra.Weissnat11	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Cierra.Weissnat11	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Cierra.Weissnat11	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Cierra.Weissnat11	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Cierra.Weissnat11	-1
821f91e3-915a-43dd-89a7-8df33e522565	Cierra.Weissnat11	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Cierra.Weissnat11	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Cierra.Weissnat11	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Cierra.Weissnat11	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Cierra.Weissnat11	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Cierra.Weissnat11	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Cierra.Weissnat11	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Cierra.Weissnat11	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Cierra.Weissnat11	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Cierra.Weissnat11	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Brayan_Hoppe86	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Brayan_Hoppe86	1
020f3109-5d91-4cdc-936d-b60387e8f326	Brayan_Hoppe86	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Brayan_Hoppe86	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Brayan_Hoppe86	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Brayan_Hoppe86	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Brayan_Hoppe86	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Brayan_Hoppe86	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Brayan_Hoppe86	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Brayan_Hoppe86	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Brayan_Hoppe86	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Brayan_Hoppe86	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Brayan_Hoppe86	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Brayan_Hoppe86	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Brayan_Hoppe86	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Brayan_Hoppe86	1
96b2311c-d26f-4462-a29c-a94753161467	Brayan_Hoppe86	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Brayan_Hoppe86	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Brayan_Hoppe86	1
2508c094-ff79-4881-b756-74234df008f2	Brayan_Hoppe86	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Brayan_Hoppe86	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Brayan_Hoppe86	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Brayan_Hoppe86	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Brayan_Hoppe86	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Brayan_Hoppe86	1
98d76875-65d1-403b-9f65-e1b77fb25903	Brayan_Hoppe86	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Brayan_Hoppe86	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Brayan_Hoppe86	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Brayan_Hoppe86	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Brayan_Hoppe86	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Brayan_Hoppe86	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Brayan_Hoppe86	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Brayan_Hoppe86	1
69199805-05c7-4301-8c05-868f29e606d6	Brayan_Hoppe86	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Brayan_Hoppe86	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Brayan_Hoppe86	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Brayan_Hoppe86	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Brayan_Hoppe86	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Brayan_Hoppe86	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Brayan_Hoppe86	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Brayan_Hoppe86	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Brayan_Hoppe86	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Brayan_Hoppe86	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Brayan_Hoppe86	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Brayan_Hoppe86	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Brayan_Hoppe86	1
532a613b-9be2-43e4-82f4-ddce03d99630	Brayan_Hoppe86	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Brayan_Hoppe86	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Brayan_Hoppe86	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Brayan_Hoppe86	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Brayan_Hoppe86	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Brayan_Hoppe86	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Brayan_Hoppe86	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Brayan_Hoppe86	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Brayan_Hoppe86	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Brayan_Hoppe86	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Brayan_Hoppe86	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Brayan_Hoppe86	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Brayan_Hoppe86	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Brayan_Hoppe86	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Brayan_Hoppe86	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Brayan_Hoppe86	-1
c02a050c-9299-4313-b24d-d42a6c189505	Brayan_Hoppe86	-1
eb43e6c6-b016-445c-b33c-05468d203319	Brayan_Hoppe86	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Brayan_Hoppe86	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Brayan_Hoppe86	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Brayan_Hoppe86	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Brayan_Hoppe86	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Brayan_Hoppe86	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Brayan_Hoppe86	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Brayan_Hoppe86	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Brayan_Hoppe86	-1
c7594724-4e46-48bf-b545-dde115e92a96	Brayan_Hoppe86	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Donna.Rutherford45	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Donna.Rutherford45	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Donna.Rutherford45	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Donna.Rutherford45	1
eb43e6c6-b016-445c-b33c-05468d203319	Donna.Rutherford45	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Donna.Rutherford45	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Donna.Rutherford45	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Donna.Rutherford45	1
23c943e0-2ea7-42c7-9112-c77c08073122	Donna.Rutherford45	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Donna.Rutherford45	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Donna.Rutherford45	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Donna.Rutherford45	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Donna.Rutherford45	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Donna.Rutherford45	1
9f20d789-935c-4109-b05a-3077a29eb1df	Donna.Rutherford45	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Donna.Rutherford45	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Donna.Rutherford45	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Donna.Rutherford45	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Donna.Rutherford45	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Donna.Rutherford45	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Donna.Rutherford45	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Donna.Rutherford45	1
98d76875-65d1-403b-9f65-e1b77fb25903	Donna.Rutherford45	1
69199805-05c7-4301-8c05-868f29e606d6	Donna.Rutherford45	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Donna.Rutherford45	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Donna.Rutherford45	1
532a613b-9be2-43e4-82f4-ddce03d99630	Donna.Rutherford45	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Donna.Rutherford45	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Donna.Rutherford45	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Donna.Rutherford45	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Donna.Rutherford45	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Donna.Rutherford45	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Donna.Rutherford45	-1
cb2730fa-9028-467f-905d-75c229ed9879	Donna.Rutherford45	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Donna.Rutherford45	-1
36858a27-3c56-46c8-af27-984828aebb98	Donna.Rutherford45	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Donna.Rutherford45	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Donna.Rutherford45	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Donna.Rutherford45	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Donna.Rutherford45	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Donna.Rutherford45	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Donna.Rutherford45	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Donna.Rutherford45	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Donna.Rutherford45	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Donna.Rutherford45	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Donna.Rutherford45	-1
96b2311c-d26f-4462-a29c-a94753161467	Donna.Rutherford45	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Donna.Rutherford45	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Murl97	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Donna.Rutherford45	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Donna.Rutherford45	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Donna.Rutherford45	-1
2508c094-ff79-4881-b756-74234df008f2	Donna.Rutherford45	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Donna.Rutherford45	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Donna.Rutherford45	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Donna.Rutherford45	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Donna.Rutherford45	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Donna.Rutherford45	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Donna.Rutherford45	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Donna.Rutherford45	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Donna.Rutherford45	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Donna.Rutherford45	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Donna.Rutherford45	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Donna.Rutherford45	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Donna.Rutherford45	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Donna.Rutherford45	-1
821f91e3-915a-43dd-89a7-8df33e522565	Donna.Rutherford45	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Donna.Rutherford45	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Donna.Rutherford45	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Donna.Rutherford45	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Donna.Rutherford45	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Donna.Rutherford45	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Donna.Rutherford45	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Donna.Rutherford45	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Donna.Rutherford45	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Donna.Rutherford45	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Murl97	1
1d5c2502-ca57-4203-9271-bd342aca5648	Murl97	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Murl97	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Murl97	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Murl97	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Murl97	-1
eb43e6c6-b016-445c-b33c-05468d203319	Murl97	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	fish_guy	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Murl97	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Murl97	1
36858a27-3c56-46c8-af27-984828aebb98	Murl97	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Murl97	1
c02a050c-9299-4313-b24d-d42a6c189505	Murl97	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Murl97	1
cb2730fa-9028-467f-905d-75c229ed9879	Murl97	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Murl97	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Murl97	1
821f91e3-915a-43dd-89a7-8df33e522565	Murl97	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Murl97	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Murl97	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Murl97	1
fc65f17f-c071-4362-b9bd-4db4308da997	Murl97	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Murl97	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Murl97	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Murl97	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Murl97	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Murl97	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Murl97	1
93b57384-8822-4eee-89cc-64c16ed25a59	Murl97	-1
2508c094-ff79-4881-b756-74234df008f2	Murl97	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Murl97	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Murl97	1
96b2311c-d26f-4462-a29c-a94753161467	Murl97	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Murl97	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Murl97	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Murl97	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Murl97	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Murl97	1
bf75a830-7874-44ca-ab46-275c273b4c76	Murl97	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Murl97	1
62978666-53c0-4edb-a671-19efd6e9457a	Murl97	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Murl97	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Murl97	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Murl97	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Murl97	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Murl97	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Murl97	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Murl97	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Murl97	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Murl97	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Murl97	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Murl97	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Murl97	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Murl97	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Murl97	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Murl97	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Murl97	-1
c7594724-4e46-48bf-b545-dde115e92a96	Murl97	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Murl97	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Murl97	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Murl97	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Murl97	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Murl97	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Murl97	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Murl97	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Murl97	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Murl97	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Murl97	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Murl97	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Murl97	-1
69199805-05c7-4301-8c05-868f29e606d6	Murl97	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Murl97	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Murl97	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Korey1	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Korey1	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Korey1	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Korey1	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Korey1	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Korey1	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Korey1	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Korey1	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Korey1	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Korey1	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Korey1	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Korey1	1
96b2311c-d26f-4462-a29c-a94753161467	Korey1	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Korey1	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Korey1	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Korey1	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Korey1	1
69199805-05c7-4301-8c05-868f29e606d6	Korey1	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Korey1	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Korey1	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Korey1	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Korey1	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Korey1	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Korey1	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Korey1	1
fc65f17f-c071-4362-b9bd-4db4308da997	Korey1	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Korey1	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Korey1	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Korey1	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Korey1	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Korey1	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Korey1	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Korey1	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Korey1	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Korey1	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Korey1	1
7e73540b-772a-49d9-b5c1-49c000461d56	Korey1	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Korey1	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Korey1	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Korey1	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Evans11	1
23c943e0-2ea7-42c7-9112-c77c08073122	Korey1	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Korey1	1
020f3109-5d91-4cdc-936d-b60387e8f326	Korey1	1
532a613b-9be2-43e4-82f4-ddce03d99630	Korey1	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Korey1	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Korey1	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Korey1	1
98d76875-65d1-403b-9f65-e1b77fb25903	Korey1	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Korey1	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Korey1	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Korey1	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Korey1	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Korey1	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Korey1	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Korey1	-1
62978666-53c0-4edb-a671-19efd6e9457a	Evans11	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Korey1	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Korey1	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Korey1	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Korey1	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Korey1	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Korey1	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Korey1	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Korey1	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Korey1	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Korey1	-1
cb2730fa-9028-467f-905d-75c229ed9879	Korey1	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Korey1	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Korey1	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Korey1	-1
36858a27-3c56-46c8-af27-984828aebb98	Korey1	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Korey1	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Korey1	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Evans11	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Evans11	1
c7594724-4e46-48bf-b545-dde115e92a96	Evans11	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Evans11	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Evans11	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Evans11	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Evans11	1
9f20d789-935c-4109-b05a-3077a29eb1df	Evans11	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Evans11	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Evans11	1
7e73540b-772a-49d9-b5c1-49c000461d56	Evans11	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Evans11	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Evans11	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Evans11	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Evans11	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Evans11	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Evans11	1
cb2730fa-9028-467f-905d-75c229ed9879	Evans11	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Evans11	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Evans11	1
020f3109-5d91-4cdc-936d-b60387e8f326	Evans11	1
2508c094-ff79-4881-b756-74234df008f2	Evans11	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Evans11	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Evans11	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Evans11	1
98d76875-65d1-403b-9f65-e1b77fb25903	Evans11	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Evans11	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Evans11	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Evans11	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Evans11	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Evans11	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Evans11	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Evans11	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Evans11	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Evans11	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Evans11	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Evans11	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Evans11	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Evans11	-1
c02a050c-9299-4313-b24d-d42a6c189505	Evans11	1
fc65f17f-c071-4362-b9bd-4db4308da997	Evans11	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Evans11	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Evans11	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Evans11	1
96b2311c-d26f-4462-a29c-a94753161467	Evans11	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Evans11	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Evans11	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Evans11	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Evans11	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Evans11	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Evans11	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Evans11	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Evans11	-1
821f91e3-915a-43dd-89a7-8df33e522565	Evans11	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Evans11	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Evans11	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Evans11	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Evans11	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Evans11	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Evans11	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Evans11	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Evans11	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Evans11	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Evans11	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Evans11	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Evans11	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Evans11	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Evans11	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Evans11	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Evans11	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Evans11	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Evans11	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Evans11	-1
36858a27-3c56-46c8-af27-984828aebb98	Evans11	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Evans11	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Evans11	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Evans11	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Evans11	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Ethel.Jacobs	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Ethel.Jacobs	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Ethel.Jacobs	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Ethel.Jacobs	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Ethel.Jacobs	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Ethel.Jacobs	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Ethel.Jacobs	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Ethel.Jacobs	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Ethel.Jacobs	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Ethel.Jacobs	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Ethel.Jacobs	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Ethel.Jacobs	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Ethel.Jacobs	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Ethel.Jacobs	1
2508c094-ff79-4881-b756-74234df008f2	Ethel.Jacobs	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Ethel.Jacobs	1
c02a050c-9299-4313-b24d-d42a6c189505	Ethel.Jacobs	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Ethel.Jacobs	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Ethel.Jacobs	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Ethel.Jacobs	1
98d76875-65d1-403b-9f65-e1b77fb25903	Ethel.Jacobs	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Ethel.Jacobs	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Ethel.Jacobs	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Ethel.Jacobs	1
1d5c2502-ca57-4203-9271-bd342aca5648	Ethel.Jacobs	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Ethel.Jacobs	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Ethel.Jacobs	1
cb2730fa-9028-467f-905d-75c229ed9879	Ethel.Jacobs	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Ethel.Jacobs	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Ethel.Jacobs	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Ethel.Jacobs	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Ethel.Jacobs	1
93b57384-8822-4eee-89cc-64c16ed25a59	Ethel.Jacobs	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Ethel.Jacobs	1
020f3109-5d91-4cdc-936d-b60387e8f326	Ethel.Jacobs	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Ethel.Jacobs	1
23c943e0-2ea7-42c7-9112-c77c08073122	Ethel.Jacobs	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Ethel.Jacobs	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Ethel.Jacobs	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Ethel.Jacobs	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Ethel.Jacobs	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Ethel.Jacobs	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Ethel.Jacobs	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Ethel.Jacobs	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Ethel.Jacobs	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Ethel.Jacobs	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Ethel.Jacobs	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Ethel.Jacobs	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Ethel.Jacobs	1
96b2311c-d26f-4462-a29c-a94753161467	Ethel.Jacobs	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Ethel.Jacobs	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Ethel.Jacobs	-1
821f91e3-915a-43dd-89a7-8df33e522565	Ethel.Jacobs	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Ethel.Jacobs	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Ethel.Jacobs	-1
c7594724-4e46-48bf-b545-dde115e92a96	Ethel.Jacobs	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Ethel.Jacobs	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Ethel.Jacobs	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Ethel.Jacobs	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Ethel.Jacobs	-1
62978666-53c0-4edb-a671-19efd6e9457a	Ethel.Jacobs	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Ethel.Jacobs	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Ethel.Jacobs	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Ethel.Jacobs	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Ethel.Jacobs	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Ethel.Jacobs	-1
eb43e6c6-b016-445c-b33c-05468d203319	Ethel.Jacobs	-1
69199805-05c7-4301-8c05-868f29e606d6	Ethel.Jacobs	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Ethel.Jacobs	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	fish_guy	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Ethel.Jacobs	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Ethel.Jacobs	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Ethel.Jacobs	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Ethel.Jacobs	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Ethel.Jacobs	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Ethel.Jacobs	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Ethel.Jacobs	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Ethel.Jacobs	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Ethel.Jacobs	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Ethel.Jacobs	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Ethel.Jacobs	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Fern33	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Fern33	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Fern33	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Fern33	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Fern33	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Fern33	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Fern33	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Fern33	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Fern33	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Fern33	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Fern33	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Fern33	1
7e73540b-772a-49d9-b5c1-49c000461d56	Fern33	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Fern33	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Fern33	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Fern33	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Fern33	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Fern33	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Fern33	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Fern33	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Fern33	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Fern33	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Fern33	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Fern33	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Fern33	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Fern33	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Fern33	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Fern33	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Fern33	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Fern33	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Fern33	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Fern33	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Fern33	1
eb43e6c6-b016-445c-b33c-05468d203319	Fern33	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Fern33	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Fern33	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	fish_guy	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	fish_guy	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	routePY	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	routePY	1
e3d32705-a4e8-4070-8224-442c946b05a8	routePY	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	routePY	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	routePY	1
62978666-53c0-4edb-a671-19efd6e9457a	routePY	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	routePY	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	routePY	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	routePY	1
69199805-05c7-4301-8c05-868f29e606d6	routePY	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	routePY	1
821f91e3-915a-43dd-89a7-8df33e522565	routePY	1
ee95e078-4299-4cb4-a596-d4348d73e21a	routePY	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	routePY	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	routePY	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	routePY	1
108e57ac-5c11-47db-a106-fc3963f7b58d	routePY	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	routePY	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	routePY	1
1d5c2502-ca57-4203-9271-bd342aca5648	routePY	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	routePY	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	routePY	1
020f3109-5d91-4cdc-936d-b60387e8f326	routePY	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	routePY	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	routePY	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	routePY	-1
23c943e0-2ea7-42c7-9112-c77c08073122	routePY	-1
bf75a830-7874-44ca-ab46-275c273b4c76	routePY	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	routePY	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	routeP1	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	routeP1	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	routeP1	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	routeP1	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	routeP1	1
96b2311c-d26f-4462-a29c-a94753161467	routeP1	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	routeP1	1
532a613b-9be2-43e4-82f4-ddce03d99630	routeP1	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	routeP1	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	routeP1	1
fc65f17f-c071-4362-b9bd-4db4308da997	routeP1	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	routeP1	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	routeP1	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	routeP1	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	routeP1	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	routeP1	1
69199805-05c7-4301-8c05-868f29e606d6	routeP1	1
36858a27-3c56-46c8-af27-984828aebb98	routeP1	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	routeP1	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	routeP1	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	routeP1	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	routeP1	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	routeP1	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	routeP1	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Velva.Lebsack	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Velva.Lebsack	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Velva.Lebsack	1
e3d32705-a4e8-4070-8224-442c946b05a8	Velva.Lebsack	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Velva.Lebsack	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Velva.Lebsack	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Velva.Lebsack	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Velva.Lebsack	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Velva.Lebsack	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Velva.Lebsack	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Velva.Lebsack	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Velva.Lebsack	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Velva.Lebsack	1
c7594724-4e46-48bf-b545-dde115e92a96	Velva.Lebsack	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Velva.Lebsack	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Velva.Lebsack	1
821f91e3-915a-43dd-89a7-8df33e522565	Velva.Lebsack	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Velva.Lebsack	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Velva.Lebsack	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Velva.Lebsack	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Velva.Lebsack	-1
62978666-53c0-4edb-a671-19efd6e9457a	Velva.Lebsack	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Velva.Lebsack	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Velva.Lebsack	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Velva.Lebsack	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	chicken_guy	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	chicken_guy	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	chicken_guy	1
96b2311c-d26f-4462-a29c-a94753161467	chicken_guy	1
c02a050c-9299-4313-b24d-d42a6c189505	chicken_guy	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	chicken_guy	1
9654831d-3c0e-4f29-b411-1111d5b059d2	chicken_guy	1
821f91e3-915a-43dd-89a7-8df33e522565	chicken_guy	1
ee95e078-4299-4cb4-a596-d4348d73e21a	chicken_guy	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	chicken_guy	1
eb9c21ab-a064-4de9-921d-c059814f81c7	chicken_guy	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	chicken_guy	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	chicken_guy	1
69199805-05c7-4301-8c05-868f29e606d6	chicken_guy	1
e3d32705-a4e8-4070-8224-442c946b05a8	chicken_guy	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	chicken_guy	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	chicken_guy	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	chicken_guy	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	chicken_guy	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	chicken_guy	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	chicken_guy	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	chicken_guy	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	chicken_guy	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	chicken_guy	-1
93b57384-8822-4eee-89cc-64c16ed25a59	chicken_guy	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	chicken_guy	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	chicken_guy	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	chicken_guy	-1
fc65f17f-c071-4362-b9bd-4db4308da997	chicken_guy	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	chicken_guy	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	chicken_guy	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Carlee.Runolfsson	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Carlee.Runolfsson	1
eb43e6c6-b016-445c-b33c-05468d203319	Carlee.Runolfsson	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Carlee.Runolfsson	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Carlee.Runolfsson	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Carlee.Runolfsson	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Carlee.Runolfsson	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Carlee.Runolfsson	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Carlee.Runolfsson	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Carlee.Runolfsson	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Carlee.Runolfsson	1
62978666-53c0-4edb-a671-19efd6e9457a	Carlee.Runolfsson	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Carlee.Runolfsson	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Carlee.Runolfsson	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Carlee.Runolfsson	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Carlee.Runolfsson	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Carlee.Runolfsson	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Carlee.Runolfsson	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Carlee.Runolfsson	1
36858a27-3c56-46c8-af27-984828aebb98	Carlee.Runolfsson	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Carlee.Runolfsson	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Carlee.Runolfsson	1
1d5c2502-ca57-4203-9271-bd342aca5648	Carlee.Runolfsson	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Carlee.Runolfsson	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Carlee.Runolfsson	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Carlee.Runolfsson	-1
c02a050c-9299-4313-b24d-d42a6c189505	Carlee.Runolfsson	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Carlee.Runolfsson	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Carlee.Runolfsson	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Carlee.Runolfsson	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Carlee.Runolfsson	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Rosalia.Aufderhar57	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Rosalia.Aufderhar57	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Rosalia.Aufderhar57	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Rosalia.Aufderhar57	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Rosalia.Aufderhar57	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Rosalia.Aufderhar57	1
fc65f17f-c071-4362-b9bd-4db4308da997	Rosalia.Aufderhar57	1
69199805-05c7-4301-8c05-868f29e606d6	Rosalia.Aufderhar57	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Rosalia.Aufderhar57	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Rosalia.Aufderhar57	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Rosalia.Aufderhar57	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Rosalia.Aufderhar57	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Rosalia.Aufderhar57	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Rosalia.Aufderhar57	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Rosalia.Aufderhar57	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Rosalia.Aufderhar57	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Rosalia.Aufderhar57	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Rosalia.Aufderhar57	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Rosalia.Aufderhar57	1
36858a27-3c56-46c8-af27-984828aebb98	Rosalia.Aufderhar57	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Rosalia.Aufderhar57	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Rosalia.Aufderhar57	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Rosalia.Aufderhar57	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Rosalia.Aufderhar57	1
62978666-53c0-4edb-a671-19efd6e9457a	Rosalia.Aufderhar57	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Rosalia.Aufderhar57	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Rosalia.Aufderhar57	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Rosalia.Aufderhar57	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Rosalia.Aufderhar57	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Rosalia.Aufderhar57	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Rosalia.Aufderhar57	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Rosalia.Aufderhar57	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Rosalia.Aufderhar57	-1
c02a050c-9299-4313-b24d-d42a6c189505	Eino_Hayes46	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Eino_Hayes46	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Eino_Hayes46	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Eino_Hayes46	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Eino_Hayes46	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Eino_Hayes46	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Eino_Hayes46	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Eino_Hayes46	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Eino_Hayes46	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Eino_Hayes46	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Eino_Hayes46	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Eino_Hayes46	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Eino_Hayes46	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Eino_Hayes46	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Eino_Hayes46	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Eino_Hayes46	1
62978666-53c0-4edb-a671-19efd6e9457a	Eino_Hayes46	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Eino_Hayes46	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Eino_Hayes46	1
69199805-05c7-4301-8c05-868f29e606d6	Eino_Hayes46	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Eino_Hayes46	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Eino_Hayes46	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Eino_Hayes46	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Eino_Hayes46	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Eino_Hayes46	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Eino_Hayes46	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Eino_Hayes46	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Eino_Hayes46	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Eino_Hayes46	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Eino_Hayes46	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Eino_Hayes46	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Eino_Hayes46	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Eino_Hayes46	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Eino_Hayes46	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Wilford_Hand	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Wilford_Hand	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Wilford_Hand	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Wilford_Hand	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Wilford_Hand	1
62978666-53c0-4edb-a671-19efd6e9457a	Wilford_Hand	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Wilford_Hand	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Wilford_Hand	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Wilford_Hand	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Wilford_Hand	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Wilford_Hand	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Wilford_Hand	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Wilford_Hand	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Wilford_Hand	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Wilford_Hand	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Wilford_Hand	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Wilford_Hand	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Wilford_Hand	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Wilford_Hand	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Wilford_Hand	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Wilford_Hand	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Wilford_Hand	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Wilford_Hand	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Wilford_Hand	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Wilford_Hand	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Wilford_Hand	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Wilford_Hand	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Wilford_Hand	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Wilford_Hand	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Wilford_Hand	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Wilford_Hand	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Wilford_Hand	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Wilford_Hand	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Maverick63	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Maverick63	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Maverick63	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Maverick63	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Maverick63	1
eb43e6c6-b016-445c-b33c-05468d203319	Maverick63	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Maverick63	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Maverick63	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Maverick63	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Maverick63	1
c7594724-4e46-48bf-b545-dde115e92a96	Maverick63	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Maverick63	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Maverick63	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Maverick63	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Maverick63	1
98d76875-65d1-403b-9f65-e1b77fb25903	Maverick63	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Maverick63	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Maverick63	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Maverick63	1
96b2311c-d26f-4462-a29c-a94753161467	Maverick63	1
821f91e3-915a-43dd-89a7-8df33e522565	Maverick63	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Maverick63	1
69199805-05c7-4301-8c05-868f29e606d6	Maverick63	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Maverick63	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Maverick63	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Maverick63	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Maverick63	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Maverick63	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Maverick63	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Maverick63	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Karley.Klocko63	1
fc65f17f-c071-4362-b9bd-4db4308da997	Karley.Klocko63	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Karley.Klocko63	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Karley.Klocko63	1
c7594724-4e46-48bf-b545-dde115e92a96	Karley.Klocko63	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Karley.Klocko63	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Karley.Klocko63	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Karley.Klocko63	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Karley.Klocko63	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Karley.Klocko63	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Karley.Klocko63	1
98d76875-65d1-403b-9f65-e1b77fb25903	Karley.Klocko63	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Karley.Klocko63	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Karley.Klocko63	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Karley.Klocko63	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Karley.Klocko63	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Karley.Klocko63	1
020f3109-5d91-4cdc-936d-b60387e8f326	Karley.Klocko63	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Karley.Klocko63	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Karley.Klocko63	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Karley.Klocko63	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Karley.Klocko63	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Karley.Klocko63	1
eb43e6c6-b016-445c-b33c-05468d203319	Karley.Klocko63	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Karley.Klocko63	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Karley.Klocko63	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Karley.Klocko63	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Karley.Klocko63	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Karley.Klocko63	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Gail71	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Gail71	1
62978666-53c0-4edb-a671-19efd6e9457a	Gail71	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Gail71	1
2508c094-ff79-4881-b756-74234df008f2	Gail71	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Gail71	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Gail71	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Gail71	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Gail71	1
fc65f17f-c071-4362-b9bd-4db4308da997	Gail71	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Gail71	1
36858a27-3c56-46c8-af27-984828aebb98	Gail71	1
7e73540b-772a-49d9-b5c1-49c000461d56	Gail71	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Gail71	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Gail71	1
93b57384-8822-4eee-89cc-64c16ed25a59	Gail71	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Gail71	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Gail71	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Gail71	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Gail71	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Gail71	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Gail71	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Gail71	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Gail71	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Gail71	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Gail71	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Gail71	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Guillermo76	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Guillermo76	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Guillermo76	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Guillermo76	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Guillermo76	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Guillermo76	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Guillermo76	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Guillermo76	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Guillermo76	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Guillermo76	1
7e73540b-772a-49d9-b5c1-49c000461d56	Guillermo76	1
c02a050c-9299-4313-b24d-d42a6c189505	Guillermo76	1
e3d32705-a4e8-4070-8224-442c946b05a8	Guillermo76	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Guillermo76	1
69199805-05c7-4301-8c05-868f29e606d6	Guillermo76	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Guillermo76	1
9f20d789-935c-4109-b05a-3077a29eb1df	Guillermo76	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Guillermo76	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Guillermo76	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Guillermo76	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Guillermo76	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Guillermo76	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Guillermo76	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Guillermo76	-1
c7594724-4e46-48bf-b545-dde115e92a96	Guillermo76	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Guillermo76	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Guillermo76	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Guillermo76	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Guillermo76	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Guillermo76	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Guillermo76	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Sibyl17	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Sibyl17	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Sibyl17	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Sibyl17	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Sibyl17	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Sibyl17	1
821f91e3-915a-43dd-89a7-8df33e522565	Sibyl17	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Sibyl17	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Sibyl17	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Sibyl17	1
62978666-53c0-4edb-a671-19efd6e9457a	Sibyl17	1
93b57384-8822-4eee-89cc-64c16ed25a59	Sibyl17	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Sibyl17	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Sibyl17	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Sibyl17	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Sibyl17	1
36858a27-3c56-46c8-af27-984828aebb98	Sibyl17	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Sibyl17	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Sibyl17	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Sibyl17	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Sibyl17	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Sibyl17	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Sibyl17	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Sibyl17	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Sibyl17	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Sibyl17	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Sibyl17	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Sibyl17	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Lola_Rempel20	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Lola_Rempel20	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Lola_Rempel20	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Lola_Rempel20	1
c02a050c-9299-4313-b24d-d42a6c189505	Lola_Rempel20	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Lola_Rempel20	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Lola_Rempel20	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Lola_Rempel20	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Lola_Rempel20	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Lola_Rempel20	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Lola_Rempel20	1
bf75a830-7874-44ca-ab46-275c273b4c76	Lola_Rempel20	1
cb2730fa-9028-467f-905d-75c229ed9879	Lola_Rempel20	1
36858a27-3c56-46c8-af27-984828aebb98	Lola_Rempel20	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Lola_Rempel20	1
532a613b-9be2-43e4-82f4-ddce03d99630	Lola_Rempel20	1
eb43e6c6-b016-445c-b33c-05468d203319	Lola_Rempel20	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Lola_Rempel20	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Lola_Rempel20	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Lola_Rempel20	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Lola_Rempel20	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Lola_Rempel20	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Lola_Rempel20	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Lola_Rempel20	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Lola_Rempel20	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Lola_Rempel20	-1
96b2311c-d26f-4462-a29c-a94753161467	Lola_Rempel20	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Lola_Rempel20	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Lola_Rempel20	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Lola_Rempel20	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Lola_Rempel20	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Jayce_Connelly7	1
96b2311c-d26f-4462-a29c-a94753161467	Jayce_Connelly7	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Jayce_Connelly7	1
cb2730fa-9028-467f-905d-75c229ed9879	Jayce_Connelly7	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Jayce_Connelly7	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Jayce_Connelly7	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Jayce_Connelly7	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Jayce_Connelly7	1
bf75a830-7874-44ca-ab46-275c273b4c76	Jayce_Connelly7	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Jayce_Connelly7	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Jayce_Connelly7	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Jayce_Connelly7	1
62978666-53c0-4edb-a671-19efd6e9457a	Jayce_Connelly7	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Jayce_Connelly7	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Jayce_Connelly7	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Jayce_Connelly7	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Jayce_Connelly7	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Jayce_Connelly7	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Jayce_Connelly7	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Jayce_Connelly7	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Jayce_Connelly7	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Jayce_Connelly7	1
93b57384-8822-4eee-89cc-64c16ed25a59	Jayce_Connelly7	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Jayce_Connelly7	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Jayce_Connelly7	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Jayce_Connelly7	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Jayce_Connelly7	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Jayce_Connelly7	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Jayce_Connelly7	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Jayce_Connelly7	-1
2508c094-ff79-4881-b756-74234df008f2	Jayce_Connelly7	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Jayce_Connelly7	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Jayce_Connelly7	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Oren47	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Oren47	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Oren47	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Oren47	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Oren47	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Oren47	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Oren47	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Oren47	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Oren47	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Oren47	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Oren47	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Oren47	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Oren47	1
c02a050c-9299-4313-b24d-d42a6c189505	Oren47	1
fc65f17f-c071-4362-b9bd-4db4308da997	Oren47	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Oren47	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Oren47	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Oren47	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Oren47	1
2508c094-ff79-4881-b756-74234df008f2	Oren47	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Oren47	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Oren47	1
9f20d789-935c-4109-b05a-3077a29eb1df	Oren47	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Oren47	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Oren47	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Oren47	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Oren47	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Leann42	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Leann42	1
93b57384-8822-4eee-89cc-64c16ed25a59	Leann42	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Leann42	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Leann42	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Leann42	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Leann42	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Leann42	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Leann42	1
532a613b-9be2-43e4-82f4-ddce03d99630	Leann42	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Leann42	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Leann42	1
2508c094-ff79-4881-b756-74234df008f2	Leann42	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Leann42	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Leann42	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Leann42	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Leann42	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Leann42	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Leann42	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Leann42	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Leann42	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Leann42	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Leann42	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Leann42	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Leann42	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Leann42	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Rey29	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Rey29	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Rey29	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Rey29	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Rey29	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Rey29	1
2508c094-ff79-4881-b756-74234df008f2	Rey29	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Rey29	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Rey29	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Rey29	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Rey29	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Rey29	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Rey29	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Rey29	1
9f20d789-935c-4109-b05a-3077a29eb1df	Rey29	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Rey29	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Rey29	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Rey29	1
23c943e0-2ea7-42c7-9112-c77c08073122	Rey29	-1
96b2311c-d26f-4462-a29c-a94753161467	Rey29	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Rey29	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Rey29	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Rey29	-1
eb43e6c6-b016-445c-b33c-05468d203319	Rey29	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Rey29	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Rey29	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Rey29	-1
36858a27-3c56-46c8-af27-984828aebb98	Rey29	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Maci.Thompson73	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Maci.Thompson73	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Maci.Thompson73	1
2508c094-ff79-4881-b756-74234df008f2	Maci.Thompson73	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Maci.Thompson73	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Maci.Thompson73	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Maci.Thompson73	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Maci.Thompson73	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Maci.Thompson73	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Maci.Thompson73	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Maci.Thompson73	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Maci.Thompson73	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Maci.Thompson73	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Maci.Thompson73	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Maci.Thompson73	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Maci.Thompson73	1
c02a050c-9299-4313-b24d-d42a6c189505	Maci.Thompson73	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Maci.Thompson73	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Maci.Thompson73	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Maci.Thompson73	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Maci.Thompson73	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Maci.Thompson73	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Maci.Thompson73	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Maci.Thompson73	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Maci.Thompson73	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Maci.Thompson73	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Maci.Thompson73	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Maci.Thompson73	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Maci.Thompson73	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Maci.Thompson73	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Haleigh_Farrell31	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Haleigh_Farrell31	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Haleigh_Farrell31	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Haleigh_Farrell31	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Haleigh_Farrell31	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Haleigh_Farrell31	1
bf75a830-7874-44ca-ab46-275c273b4c76	Haleigh_Farrell31	1
e3d32705-a4e8-4070-8224-442c946b05a8	Haleigh_Farrell31	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Haleigh_Farrell31	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Haleigh_Farrell31	1
c7594724-4e46-48bf-b545-dde115e92a96	Haleigh_Farrell31	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Haleigh_Farrell31	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Haleigh_Farrell31	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Haleigh_Farrell31	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Haleigh_Farrell31	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Haleigh_Farrell31	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Haleigh_Farrell31	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Haleigh_Farrell31	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Haleigh_Farrell31	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Haleigh_Farrell31	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Haleigh_Farrell31	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Haleigh_Farrell31	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Haleigh_Farrell31	-1
96b2311c-d26f-4462-a29c-a94753161467	Haleigh_Farrell31	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Haleigh_Farrell31	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Haleigh_Farrell31	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Haleigh_Farrell31	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Hannah58	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Hannah58	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Hannah58	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Hannah58	1
cb2730fa-9028-467f-905d-75c229ed9879	Hannah58	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Hannah58	1
9f20d789-935c-4109-b05a-3077a29eb1df	Hannah58	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Hannah58	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Hannah58	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Hannah58	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Hannah58	1
23c943e0-2ea7-42c7-9112-c77c08073122	Hannah58	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Hannah58	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Hannah58	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Hannah58	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Hannah58	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Hannah58	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Hannah58	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Hannah58	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Hannah58	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Hannah58	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Hannah58	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Hannah58	1
821f91e3-915a-43dd-89a7-8df33e522565	Hannah58	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Hannah58	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Hannah58	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Kirk_Bogisich49	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Kirk_Bogisich49	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Kirk_Bogisich49	1
eb43e6c6-b016-445c-b33c-05468d203319	Kirk_Bogisich49	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Kirk_Bogisich49	1
532a613b-9be2-43e4-82f4-ddce03d99630	Kirk_Bogisich49	1
c02a050c-9299-4313-b24d-d42a6c189505	Kirk_Bogisich49	1
fc65f17f-c071-4362-b9bd-4db4308da997	Kirk_Bogisich49	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Kirk_Bogisich49	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Kirk_Bogisich49	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Kirk_Bogisich49	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Kirk_Bogisich49	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Kirk_Bogisich49	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Kirk_Bogisich49	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Kirk_Bogisich49	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Kirk_Bogisich49	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Kirk_Bogisich49	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Kirk_Bogisich49	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Kirk_Bogisich49	1
cb2730fa-9028-467f-905d-75c229ed9879	Kirk_Bogisich49	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Kirk_Bogisich49	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Kirk_Bogisich49	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Kirk_Bogisich49	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Kirk_Bogisich49	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Kirk_Bogisich49	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Kirk_Bogisich49	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Kirk_Bogisich49	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Kirk_Bogisich49	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Kirk_Bogisich49	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Kirk_Bogisich49	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Joan43	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Joan43	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Joan43	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Joan43	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Joan43	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Joan43	1
23c943e0-2ea7-42c7-9112-c77c08073122	Joan43	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Joan43	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Joan43	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Joan43	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Joan43	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Joan43	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Joan43	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Joan43	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Joan43	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Joan43	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Joan43	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Joan43	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Joan43	1
e3d32705-a4e8-4070-8224-442c946b05a8	Joan43	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Joan43	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Joan43	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Joan43	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Joan43	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Joan43	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Joan43	-1
821f91e3-915a-43dd-89a7-8df33e522565	Joan43	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Joan43	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Joan43	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Joan43	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Joan43	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Domenico_Williamson8	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Domenico_Williamson8	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Domenico_Williamson8	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Domenico_Williamson8	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Domenico_Williamson8	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Domenico_Williamson8	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Domenico_Williamson8	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Domenico_Williamson8	1
62978666-53c0-4edb-a671-19efd6e9457a	Domenico_Williamson8	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Domenico_Williamson8	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Domenico_Williamson8	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Domenico_Williamson8	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Domenico_Williamson8	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Domenico_Williamson8	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Domenico_Williamson8	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Domenico_Williamson8	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Domenico_Williamson8	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Domenico_Williamson8	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Domenico_Williamson8	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Domenico_Williamson8	-1
c7594724-4e46-48bf-b545-dde115e92a96	Domenico_Williamson8	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Domenico_Williamson8	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Domenico_Williamson8	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Domenico_Williamson8	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Domenico_Williamson8	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Domenico_Williamson8	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Domenico_Williamson8	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Morgan_Borer	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Morgan_Borer	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Morgan_Borer	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Morgan_Borer	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Morgan_Borer	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Morgan_Borer	1
7e73540b-772a-49d9-b5c1-49c000461d56	Morgan_Borer	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Morgan_Borer	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Morgan_Borer	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Morgan_Borer	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Morgan_Borer	1
c7594724-4e46-48bf-b545-dde115e92a96	Morgan_Borer	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Morgan_Borer	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Morgan_Borer	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Morgan_Borer	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Morgan_Borer	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Morgan_Borer	1
821f91e3-915a-43dd-89a7-8df33e522565	Morgan_Borer	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Morgan_Borer	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Morgan_Borer	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Morgan_Borer	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Morgan_Borer	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Morgan_Borer	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Morgan_Borer	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Leta2	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Leta2	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Leta2	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Leta2	1
23c943e0-2ea7-42c7-9112-c77c08073122	Leta2	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Leta2	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Leta2	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Leta2	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Leta2	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Leta2	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Leta2	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Leta2	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Leta2	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Leta2	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Leta2	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Leta2	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Leta2	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Leta2	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Leta2	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Leta2	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Leta2	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Leta2	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Leta2	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Leta2	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Leta2	1
821f91e3-915a-43dd-89a7-8df33e522565	Leta2	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Leta2	-1
c7594724-4e46-48bf-b545-dde115e92a96	Leta2	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Leta2	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Leta2	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Leta2	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Samanta46	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Samanta46	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Samanta46	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Samanta46	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Samanta46	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Samanta46	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Samanta46	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Samanta46	1
1d5c2502-ca57-4203-9271-bd342aca5648	Samanta46	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Samanta46	1
020f3109-5d91-4cdc-936d-b60387e8f326	Samanta46	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Samanta46	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Samanta46	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Samanta46	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Samanta46	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Samanta46	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Samanta46	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Samanta46	1
98d76875-65d1-403b-9f65-e1b77fb25903	Samanta46	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Samanta46	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Samanta46	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Samanta46	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Samanta46	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Samanta46	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Samanta46	1
93b57384-8822-4eee-89cc-64c16ed25a59	Samanta46	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Samanta46	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Samanta46	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Samanta46	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Cierra.Weissnat11	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Cierra.Weissnat11	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Cierra.Weissnat11	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Cierra.Weissnat11	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Cierra.Weissnat11	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Cierra.Weissnat11	1
62978666-53c0-4edb-a671-19efd6e9457a	Cierra.Weissnat11	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Cierra.Weissnat11	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Cierra.Weissnat11	1
36858a27-3c56-46c8-af27-984828aebb98	Cierra.Weissnat11	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Cierra.Weissnat11	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Cierra.Weissnat11	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Cierra.Weissnat11	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Cierra.Weissnat11	1
fc65f17f-c071-4362-b9bd-4db4308da997	Cierra.Weissnat11	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Cierra.Weissnat11	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Cierra.Weissnat11	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Cierra.Weissnat11	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Cierra.Weissnat11	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Brayan_Hoppe86	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Brayan_Hoppe86	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Brayan_Hoppe86	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Brayan_Hoppe86	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Brayan_Hoppe86	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Brayan_Hoppe86	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Brayan_Hoppe86	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Brayan_Hoppe86	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Brayan_Hoppe86	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Brayan_Hoppe86	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Brayan_Hoppe86	1
62978666-53c0-4edb-a671-19efd6e9457a	Brayan_Hoppe86	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Brayan_Hoppe86	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Brayan_Hoppe86	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Brayan_Hoppe86	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Brayan_Hoppe86	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Brayan_Hoppe86	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Brayan_Hoppe86	1
e3d32705-a4e8-4070-8224-442c946b05a8	Brayan_Hoppe86	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Brayan_Hoppe86	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Brayan_Hoppe86	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Brayan_Hoppe86	1
bf75a830-7874-44ca-ab46-275c273b4c76	Brayan_Hoppe86	1
36858a27-3c56-46c8-af27-984828aebb98	Brayan_Hoppe86	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Brayan_Hoppe86	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Brayan_Hoppe86	1
821f91e3-915a-43dd-89a7-8df33e522565	Brayan_Hoppe86	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Brayan_Hoppe86	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Brayan_Hoppe86	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Brayan_Hoppe86	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Brayan_Hoppe86	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Brayan_Hoppe86	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Brayan_Hoppe86	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Brayan_Hoppe86	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Donna.Rutherford45	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Donna.Rutherford45	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Donna.Rutherford45	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Donna.Rutherford45	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Donna.Rutherford45	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Donna.Rutherford45	1
c02a050c-9299-4313-b24d-d42a6c189505	Donna.Rutherford45	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Donna.Rutherford45	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Donna.Rutherford45	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Donna.Rutherford45	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Donna.Rutherford45	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Donna.Rutherford45	1
c7594724-4e46-48bf-b545-dde115e92a96	Donna.Rutherford45	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Donna.Rutherford45	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Donna.Rutherford45	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Donna.Rutherford45	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Donna.Rutherford45	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Donna.Rutherford45	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Donna.Rutherford45	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Donna.Rutherford45	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Donna.Rutherford45	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Donna.Rutherford45	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Donna.Rutherford45	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Donna.Rutherford45	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Donna.Rutherford45	-1
62978666-53c0-4edb-a671-19efd6e9457a	Donna.Rutherford45	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Donna.Rutherford45	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Donna.Rutherford45	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Murl97	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Murl97	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Murl97	1
020f3109-5d91-4cdc-936d-b60387e8f326	Murl97	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Murl97	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Murl97	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Murl97	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Murl97	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Murl97	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Murl97	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Murl97	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Murl97	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Murl97	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Murl97	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Murl97	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Murl97	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Murl97	1
532a613b-9be2-43e4-82f4-ddce03d99630	Murl97	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Murl97	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Murl97	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Murl97	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Murl97	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Murl97	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Murl97	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Murl97	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Murl97	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Murl97	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Korey1	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Korey1	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Korey1	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Korey1	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Korey1	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Korey1	1
821f91e3-915a-43dd-89a7-8df33e522565	Korey1	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Korey1	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Korey1	1
9f20d789-935c-4109-b05a-3077a29eb1df	Korey1	1
eb43e6c6-b016-445c-b33c-05468d203319	Korey1	1
c7594724-4e46-48bf-b545-dde115e92a96	Korey1	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Korey1	1
c02a050c-9299-4313-b24d-d42a6c189505	Korey1	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Korey1	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Korey1	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Korey1	1
62978666-53c0-4edb-a671-19efd6e9457a	Korey1	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Korey1	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Korey1	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Korey1	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Korey1	1
2508c094-ff79-4881-b756-74234df008f2	Korey1	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Korey1	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Korey1	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Korey1	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Korey1	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Korey1	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Korey1	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Korey1	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Korey1	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Korey1	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Korey1	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Evans11	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Evans11	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Evans11	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Evans11	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Evans11	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Evans11	1
532a613b-9be2-43e4-82f4-ddce03d99630	Evans11	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Evans11	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Evans11	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Evans11	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Evans11	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Evans11	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Evans11	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Evans11	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Evans11	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Evans11	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Evans11	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Evans11	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Evans11	1
e3d32705-a4e8-4070-8224-442c946b05a8	Evans11	1
69199805-05c7-4301-8c05-868f29e606d6	Evans11	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Evans11	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Evans11	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Evans11	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Evans11	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Evans11	-1
eb43e6c6-b016-445c-b33c-05468d203319	Evans11	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Ethel.Jacobs	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Ethel.Jacobs	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Ethel.Jacobs	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Ethel.Jacobs	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Ethel.Jacobs	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Ethel.Jacobs	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Ethel.Jacobs	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Ethel.Jacobs	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Ethel.Jacobs	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Ethel.Jacobs	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Ethel.Jacobs	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Ethel.Jacobs	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Ethel.Jacobs	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Ethel.Jacobs	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Ethel.Jacobs	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Ethel.Jacobs	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Ethel.Jacobs	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Ethel.Jacobs	1
532a613b-9be2-43e4-82f4-ddce03d99630	Ethel.Jacobs	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Ethel.Jacobs	1
e3d32705-a4e8-4070-8224-442c946b05a8	Ethel.Jacobs	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Ethel.Jacobs	1
fc65f17f-c071-4362-b9bd-4db4308da997	Ethel.Jacobs	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Ethel.Jacobs	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Ethel.Jacobs	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Ethel.Jacobs	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Ethel.Jacobs	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Fern33	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Fern33	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Fern33	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Fern33	1
98d76875-65d1-403b-9f65-e1b77fb25903	Fern33	1
c7594724-4e46-48bf-b545-dde115e92a96	Fern33	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Fern33	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Fern33	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Fern33	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Fern33	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Fern33	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Fern33	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Fern33	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Fern33	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Fern33	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Fern33	1
c02a050c-9299-4313-b24d-d42a6c189505	Fern33	1
1d5c2502-ca57-4203-9271-bd342aca5648	Fern33	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Fern33	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Fern33	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Fern33	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Fern33	1
e3d32705-a4e8-4070-8224-442c946b05a8	Fern33	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Fern33	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Fern33	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Fern33	1
532a613b-9be2-43e4-82f4-ddce03d99630	Fern33	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Fern33	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Fern33	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Fern33	1
2508c094-ff79-4881-b756-74234df008f2	Fern33	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Fern33	1
cb2730fa-9028-467f-905d-75c229ed9879	Fern33	1
96b2311c-d26f-4462-a29c-a94753161467	Fern33	1
9f20d789-935c-4109-b05a-3077a29eb1df	Fern33	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Fern33	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Fern33	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Fern33	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Fern33	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Fern33	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Fern33	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Fern33	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Fern33	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Fern33	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Fern33	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Fern33	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Fern33	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Fern33	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Fern33	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Fern33	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Fern33	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Fern33	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Lottie.Kutch	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Lottie.Kutch	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Lottie.Kutch	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Lottie.Kutch	1
e3d32705-a4e8-4070-8224-442c946b05a8	Lottie.Kutch	1
bf75a830-7874-44ca-ab46-275c273b4c76	Lottie.Kutch	1
7e73540b-772a-49d9-b5c1-49c000461d56	Lottie.Kutch	1
1d5c2502-ca57-4203-9271-bd342aca5648	Lottie.Kutch	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Lottie.Kutch	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Lottie.Kutch	1
96b2311c-d26f-4462-a29c-a94753161467	Lottie.Kutch	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Lottie.Kutch	1
2508c094-ff79-4881-b756-74234df008f2	Lottie.Kutch	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Lottie.Kutch	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Lottie.Kutch	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Lottie.Kutch	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Lottie.Kutch	1
eb43e6c6-b016-445c-b33c-05468d203319	Lottie.Kutch	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Lottie.Kutch	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Lottie.Kutch	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Lottie.Kutch	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Lottie.Kutch	1
c02a050c-9299-4313-b24d-d42a6c189505	Lottie.Kutch	1
36858a27-3c56-46c8-af27-984828aebb98	Lottie.Kutch	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Lottie.Kutch	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Lottie.Kutch	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Lottie.Kutch	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Lottie.Kutch	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Lottie.Kutch	1
c7594724-4e46-48bf-b545-dde115e92a96	Lottie.Kutch	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Lottie.Kutch	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Lottie.Kutch	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Lottie.Kutch	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Lottie.Kutch	1
93b57384-8822-4eee-89cc-64c16ed25a59	Lottie.Kutch	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Lottie.Kutch	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Lottie.Kutch	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Lottie.Kutch	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Lottie.Kutch	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Lottie.Kutch	1
532a613b-9be2-43e4-82f4-ddce03d99630	Lottie.Kutch	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Lottie.Kutch	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Lottie.Kutch	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Lottie.Kutch	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Lottie.Kutch	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Lottie.Kutch	1
62978666-53c0-4edb-a671-19efd6e9457a	Lottie.Kutch	1
020f3109-5d91-4cdc-936d-b60387e8f326	Lottie.Kutch	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Lottie.Kutch	1
98d76875-65d1-403b-9f65-e1b77fb25903	Lottie.Kutch	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Lottie.Kutch	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Lottie.Kutch	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Lottie.Kutch	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Lottie.Kutch	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Lottie.Kutch	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Lottie.Kutch	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Lottie.Kutch	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Lottie.Kutch	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Lottie.Kutch	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Lottie.Kutch	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Lottie.Kutch	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Lottie.Kutch	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Lottie.Kutch	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Lottie.Kutch	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Lottie.Kutch	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Lottie.Kutch	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Lottie.Kutch	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Lottie.Kutch	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Price53	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Price53	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Price53	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Price53	1
7e73540b-772a-49d9-b5c1-49c000461d56	Price53	1
fc65f17f-c071-4362-b9bd-4db4308da997	Price53	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Price53	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Price53	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Price53	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Price53	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Price53	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Price53	1
96b2311c-d26f-4462-a29c-a94753161467	Price53	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Price53	1
e3d32705-a4e8-4070-8224-442c946b05a8	Price53	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Price53	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Price53	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Price53	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Price53	1
69199805-05c7-4301-8c05-868f29e606d6	Price53	1
36858a27-3c56-46c8-af27-984828aebb98	Price53	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Price53	1
cb2730fa-9028-467f-905d-75c229ed9879	Price53	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Price53	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Price53	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Price53	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Price53	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Price53	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Price53	1
020f3109-5d91-4cdc-936d-b60387e8f326	Price53	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Price53	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Price53	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Price53	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Price53	1
c02a050c-9299-4313-b24d-d42a6c189505	Price53	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Price53	1
532a613b-9be2-43e4-82f4-ddce03d99630	Price53	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Price53	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Price53	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Price53	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Price53	1
93b57384-8822-4eee-89cc-64c16ed25a59	Price53	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Price53	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Price53	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Price53	1
2508c094-ff79-4881-b756-74234df008f2	Price53	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Price53	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Price53	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Price53	1
eb43e6c6-b016-445c-b33c-05468d203319	Price53	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Price53	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Price53	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Price53	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Price53	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Price53	1
bf75a830-7874-44ca-ab46-275c273b4c76	Price53	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Price53	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Price53	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Price53	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Price53	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Price53	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Price53	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Price53	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Price53	-1
62978666-53c0-4edb-a671-19efd6e9457a	Price53	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Price53	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Price53	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Price53	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Price53	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Price53	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Price53	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Price53	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Price53	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Price53	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Price53	-1
821f91e3-915a-43dd-89a7-8df33e522565	Price53	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Price53	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Jolie19	1
c7594724-4e46-48bf-b545-dde115e92a96	Jolie19	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Jolie19	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Jolie19	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Jolie19	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Jolie19	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Jolie19	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Jolie19	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Jolie19	1
96b2311c-d26f-4462-a29c-a94753161467	Jolie19	1
bf75a830-7874-44ca-ab46-275c273b4c76	Jolie19	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Jolie19	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Jolie19	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Jolie19	1
1d5c2502-ca57-4203-9271-bd342aca5648	Jolie19	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Jolie19	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Jolie19	1
98d76875-65d1-403b-9f65-e1b77fb25903	Jolie19	1
23c943e0-2ea7-42c7-9112-c77c08073122	Jolie19	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Jolie19	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Jolie19	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Jolie19	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Jolie19	1
2508c094-ff79-4881-b756-74234df008f2	Jolie19	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Jolie19	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Jolie19	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Jolie19	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Jolie19	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Jolie19	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Jolie19	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Jolie19	1
e3d32705-a4e8-4070-8224-442c946b05a8	Jolie19	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Jolie19	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Jolie19	1
69199805-05c7-4301-8c05-868f29e606d6	Jolie19	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Jolie19	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Jolie19	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Jolie19	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Jolie19	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Jolie19	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Jolie19	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Jolie19	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Jolie19	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Jolie19	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Jolie19	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Jolie19	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Jolie19	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Jolie19	1
62978666-53c0-4edb-a671-19efd6e9457a	Jolie19	1
cb2730fa-9028-467f-905d-75c229ed9879	Jolie19	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Jolie19	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Jolie19	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Jolie19	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Jolie19	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Jolie19	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Jolie19	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Jolie19	-1
821f91e3-915a-43dd-89a7-8df33e522565	Jolie19	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Jolie19	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Jolie19	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Jolie19	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Jolie19	-1
36858a27-3c56-46c8-af27-984828aebb98	Jolie19	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Jolie19	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Jolie19	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Jolie19	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Jolie19	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Jolie19	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Jolie19	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Jolie19	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Jolie19	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Elsie_Rodriguez31	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Elsie_Rodriguez31	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Elsie_Rodriguez31	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Elsie_Rodriguez31	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Elsie_Rodriguez31	1
bf75a830-7874-44ca-ab46-275c273b4c76	Elsie_Rodriguez31	1
96b2311c-d26f-4462-a29c-a94753161467	Elsie_Rodriguez31	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Elsie_Rodriguez31	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Elsie_Rodriguez31	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Elsie_Rodriguez31	1
020f3109-5d91-4cdc-936d-b60387e8f326	Elsie_Rodriguez31	1
fc65f17f-c071-4362-b9bd-4db4308da997	Elsie_Rodriguez31	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Elsie_Rodriguez31	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Elsie_Rodriguez31	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Elsie_Rodriguez31	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Elsie_Rodriguez31	1
2508c094-ff79-4881-b756-74234df008f2	Elsie_Rodriguez31	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Elsie_Rodriguez31	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Elsie_Rodriguez31	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Elsie_Rodriguez31	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Elsie_Rodriguez31	1
23c943e0-2ea7-42c7-9112-c77c08073122	Elsie_Rodriguez31	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Elsie_Rodriguez31	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Elsie_Rodriguez31	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Elsie_Rodriguez31	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Elsie_Rodriguez31	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Elsie_Rodriguez31	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Elsie_Rodriguez31	1
821f91e3-915a-43dd-89a7-8df33e522565	Elsie_Rodriguez31	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Elsie_Rodriguez31	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Elsie_Rodriguez31	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Elsie_Rodriguez31	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Elsie_Rodriguez31	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Elsie_Rodriguez31	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Elsie_Rodriguez31	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Elsie_Rodriguez31	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Elsie_Rodriguez31	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Elsie_Rodriguez31	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Elsie_Rodriguez31	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Elsie_Rodriguez31	1
c02a050c-9299-4313-b24d-d42a6c189505	Elsie_Rodriguez31	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Elsie_Rodriguez31	1
62978666-53c0-4edb-a671-19efd6e9457a	Elsie_Rodriguez31	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Elsie_Rodriguez31	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Elsie_Rodriguez31	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Elsie_Rodriguez31	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Elsie_Rodriguez31	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Elsie_Rodriguez31	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Elsie_Rodriguez31	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Elsie_Rodriguez31	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Elsie_Rodriguez31	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Elsie_Rodriguez31	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Elsie_Rodriguez31	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Elsie_Rodriguez31	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Elsie_Rodriguez31	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Elsie_Rodriguez31	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Elsie_Rodriguez31	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Elsie_Rodriguez31	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Elsie_Rodriguez31	1
9f20d789-935c-4109-b05a-3077a29eb1df	Elsie_Rodriguez31	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Elsie_Rodriguez31	1
532a613b-9be2-43e4-82f4-ddce03d99630	Elsie_Rodriguez31	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Elsie_Rodriguez31	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Elsie_Rodriguez31	-1
cb2730fa-9028-467f-905d-75c229ed9879	Elsie_Rodriguez31	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Elsie_Rodriguez31	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Elsie_Rodriguez31	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Elsie_Rodriguez31	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Elsie_Rodriguez31	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Elsie_Rodriguez31	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Elsie_Rodriguez31	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Elsie_Rodriguez31	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Elsie_Rodriguez31	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Elsie_Rodriguez31	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Elsie_Rodriguez31	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Elsie_Rodriguez31	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Elsie_Rodriguez31	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Elsie_Rodriguez31	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Elsie_Rodriguez31	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Elsie_Rodriguez31	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Sven97	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Sven97	1
7e73540b-772a-49d9-b5c1-49c000461d56	Sven97	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Sven97	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Sven97	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Sven97	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Sven97	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Sven97	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Sven97	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Sven97	1
fc65f17f-c071-4362-b9bd-4db4308da997	Sven97	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Sven97	1
cb2730fa-9028-467f-905d-75c229ed9879	Sven97	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Sven97	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Sven97	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Sven97	1
62978666-53c0-4edb-a671-19efd6e9457a	Sven97	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Sven97	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Sven97	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Sven97	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Sven97	1
532a613b-9be2-43e4-82f4-ddce03d99630	Sven97	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Sven97	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Sven97	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Sven97	1
020f3109-5d91-4cdc-936d-b60387e8f326	Sven97	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Sven97	1
96b2311c-d26f-4462-a29c-a94753161467	Sven97	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Sven97	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Sven97	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Sven97	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Sven97	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Sven97	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Sven97	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Sven97	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Sven97	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Sven97	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Sven97	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Sven97	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Sven97	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Sven97	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Sven97	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Sven97	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Sven97	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Sven97	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Sven97	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Sven97	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Sven97	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Sven97	1
e3d32705-a4e8-4070-8224-442c946b05a8	Sven97	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Sven97	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Sven97	1
93b57384-8822-4eee-89cc-64c16ed25a59	Sven97	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Sven97	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Sven97	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Sven97	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Sven97	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Sven97	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Sven97	1
2508c094-ff79-4881-b756-74234df008f2	Sven97	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Sven97	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Sven97	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Sven97	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Sven97	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Sven97	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Sven97	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Sven97	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Sven97	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Sven97	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Sven97	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Sven97	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Sven97	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Sven97	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Sven97	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Sven97	-1
eb43e6c6-b016-445c-b33c-05468d203319	Sven97	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Sven97	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Sven97	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Sven97	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Sven97	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Sven97	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Harley_Gusikowski	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Harley_Gusikowski	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Harley_Gusikowski	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Harley_Gusikowski	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Harley_Gusikowski	1
020f3109-5d91-4cdc-936d-b60387e8f326	Harley_Gusikowski	1
532a613b-9be2-43e4-82f4-ddce03d99630	Harley_Gusikowski	1
1d5c2502-ca57-4203-9271-bd342aca5648	Harley_Gusikowski	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Harley_Gusikowski	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Harley_Gusikowski	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Harley_Gusikowski	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Harley_Gusikowski	1
23c943e0-2ea7-42c7-9112-c77c08073122	Harley_Gusikowski	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Harley_Gusikowski	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Harley_Gusikowski	1
9f20d789-935c-4109-b05a-3077a29eb1df	Harley_Gusikowski	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Harley_Gusikowski	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Harley_Gusikowski	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Harley_Gusikowski	1
69199805-05c7-4301-8c05-868f29e606d6	Harley_Gusikowski	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Harley_Gusikowski	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Harley_Gusikowski	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Harley_Gusikowski	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Harley_Gusikowski	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Harley_Gusikowski	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Harley_Gusikowski	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Harley_Gusikowski	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Harley_Gusikowski	1
36858a27-3c56-46c8-af27-984828aebb98	Harley_Gusikowski	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Harley_Gusikowski	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Harley_Gusikowski	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Harley_Gusikowski	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Harley_Gusikowski	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Harley_Gusikowski	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Harley_Gusikowski	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Harley_Gusikowski	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Harley_Gusikowski	1
821f91e3-915a-43dd-89a7-8df33e522565	Harley_Gusikowski	1
c02a050c-9299-4313-b24d-d42a6c189505	Harley_Gusikowski	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Harley_Gusikowski	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Harley_Gusikowski	1
c7594724-4e46-48bf-b545-dde115e92a96	Harley_Gusikowski	1
e3d32705-a4e8-4070-8224-442c946b05a8	Harley_Gusikowski	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Harley_Gusikowski	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Harley_Gusikowski	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Harley_Gusikowski	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Harley_Gusikowski	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Harley_Gusikowski	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Harley_Gusikowski	1
bf75a830-7874-44ca-ab46-275c273b4c76	Harley_Gusikowski	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Harley_Gusikowski	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Harley_Gusikowski	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Harley_Gusikowski	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Harley_Gusikowski	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Harley_Gusikowski	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Harley_Gusikowski	1
93b57384-8822-4eee-89cc-64c16ed25a59	Harley_Gusikowski	-1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Harley_Gusikowski	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Harley_Gusikowski	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Harley_Gusikowski	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Harley_Gusikowski	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Harley_Gusikowski	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Harley_Gusikowski	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Harley_Gusikowski	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Harley_Gusikowski	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Harley_Gusikowski	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Harley_Gusikowski	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Harley_Gusikowski	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Harley_Gusikowski	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Harley_Gusikowski	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Harley_Gusikowski	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Harley_Gusikowski	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Harley_Gusikowski	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Harley_Gusikowski	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Christopher_Senger	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Christopher_Senger	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Christopher_Senger	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Christopher_Senger	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Christopher_Senger	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Christopher_Senger	1
2508c094-ff79-4881-b756-74234df008f2	Christopher_Senger	1
821f91e3-915a-43dd-89a7-8df33e522565	Christopher_Senger	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Christopher_Senger	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Christopher_Senger	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Christopher_Senger	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Christopher_Senger	1
69199805-05c7-4301-8c05-868f29e606d6	Christopher_Senger	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Christopher_Senger	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Christopher_Senger	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Christopher_Senger	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Christopher_Senger	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Christopher_Senger	1
98d76875-65d1-403b-9f65-e1b77fb25903	Christopher_Senger	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Christopher_Senger	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Christopher_Senger	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Christopher_Senger	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Christopher_Senger	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Christopher_Senger	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Christopher_Senger	1
96b2311c-d26f-4462-a29c-a94753161467	Christopher_Senger	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Christopher_Senger	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Christopher_Senger	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Christopher_Senger	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Christopher_Senger	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Christopher_Senger	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Christopher_Senger	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Christopher_Senger	1
36858a27-3c56-46c8-af27-984828aebb98	Christopher_Senger	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Christopher_Senger	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Christopher_Senger	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Christopher_Senger	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Christopher_Senger	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Christopher_Senger	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Christopher_Senger	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Christopher_Senger	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Christopher_Senger	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Christopher_Senger	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Christopher_Senger	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Christopher_Senger	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Christopher_Senger	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Christopher_Senger	1
020f3109-5d91-4cdc-936d-b60387e8f326	Christopher_Senger	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Christopher_Senger	1
eb43e6c6-b016-445c-b33c-05468d203319	Christopher_Senger	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Christopher_Senger	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Christopher_Senger	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Christopher_Senger	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Christopher_Senger	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Christopher_Senger	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Christopher_Senger	1
c7594724-4e46-48bf-b545-dde115e92a96	Christopher_Senger	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Christopher_Senger	1
fc65f17f-c071-4362-b9bd-4db4308da997	Christopher_Senger	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Christopher_Senger	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Christopher_Senger	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Christopher_Senger	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Christopher_Senger	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Christopher_Senger	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Christopher_Senger	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Christopher_Senger	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Christopher_Senger	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Christopher_Senger	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Christopher_Senger	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Christopher_Senger	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Christopher_Senger	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Christopher_Senger	-1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Christopher_Senger	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Christopher_Senger	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Christopher_Senger	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Christopher_Senger	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Christopher_Senger	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Christopher_Senger	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Elijah_Gulgowski59	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Elijah_Gulgowski59	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Elijah_Gulgowski59	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Elijah_Gulgowski59	1
c7594724-4e46-48bf-b545-dde115e92a96	Elijah_Gulgowski59	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Elijah_Gulgowski59	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Elijah_Gulgowski59	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Elijah_Gulgowski59	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Elijah_Gulgowski59	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Elijah_Gulgowski59	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Elijah_Gulgowski59	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Elijah_Gulgowski59	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Elijah_Gulgowski59	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Elijah_Gulgowski59	1
1d5c2502-ca57-4203-9271-bd342aca5648	Elijah_Gulgowski59	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Elijah_Gulgowski59	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Elijah_Gulgowski59	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Elijah_Gulgowski59	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Elijah_Gulgowski59	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Elijah_Gulgowski59	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Elijah_Gulgowski59	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Elijah_Gulgowski59	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Elijah_Gulgowski59	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Elijah_Gulgowski59	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Elijah_Gulgowski59	1
532a613b-9be2-43e4-82f4-ddce03d99630	Elijah_Gulgowski59	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Elijah_Gulgowski59	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Elijah_Gulgowski59	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Elijah_Gulgowski59	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Elijah_Gulgowski59	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Elijah_Gulgowski59	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Elijah_Gulgowski59	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Elijah_Gulgowski59	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Elijah_Gulgowski59	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Elijah_Gulgowski59	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Elijah_Gulgowski59	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Elijah_Gulgowski59	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Elijah_Gulgowski59	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Elijah_Gulgowski59	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Elijah_Gulgowski59	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Elijah_Gulgowski59	1
020f3109-5d91-4cdc-936d-b60387e8f326	Elijah_Gulgowski59	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Elijah_Gulgowski59	1
821f91e3-915a-43dd-89a7-8df33e522565	Elijah_Gulgowski59	1
fc65f17f-c071-4362-b9bd-4db4308da997	Elijah_Gulgowski59	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Elijah_Gulgowski59	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Elijah_Gulgowski59	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Elijah_Gulgowski59	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Elijah_Gulgowski59	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Elijah_Gulgowski59	1
69199805-05c7-4301-8c05-868f29e606d6	Elijah_Gulgowski59	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Elijah_Gulgowski59	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Elijah_Gulgowski59	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Elijah_Gulgowski59	1
7e73540b-772a-49d9-b5c1-49c000461d56	Elijah_Gulgowski59	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Elijah_Gulgowski59	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Elijah_Gulgowski59	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Elijah_Gulgowski59	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Elijah_Gulgowski59	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Elijah_Gulgowski59	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Elijah_Gulgowski59	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Elijah_Gulgowski59	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Elijah_Gulgowski59	-1
62978666-53c0-4edb-a671-19efd6e9457a	Elijah_Gulgowski59	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Elijah_Gulgowski59	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Elijah_Gulgowski59	-1
eb43e6c6-b016-445c-b33c-05468d203319	Elijah_Gulgowski59	-1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Elijah_Gulgowski59	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Elijah_Gulgowski59	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Elijah_Gulgowski59	-1
96b2311c-d26f-4462-a29c-a94753161467	Elijah_Gulgowski59	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Elijah_Gulgowski59	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Elijah_Gulgowski59	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Elijah_Gulgowski59	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Elijah_Gulgowski59	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Glen_Krajcik13	1
c7594724-4e46-48bf-b545-dde115e92a96	Glen_Krajcik13	1
eb43e6c6-b016-445c-b33c-05468d203319	Glen_Krajcik13	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Glen_Krajcik13	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Glen_Krajcik13	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Glen_Krajcik13	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Glen_Krajcik13	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Glen_Krajcik13	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Glen_Krajcik13	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Glen_Krajcik13	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Glen_Krajcik13	1
bf75a830-7874-44ca-ab46-275c273b4c76	Glen_Krajcik13	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Glen_Krajcik13	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Glen_Krajcik13	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Glen_Krajcik13	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Glen_Krajcik13	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Glen_Krajcik13	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Glen_Krajcik13	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Glen_Krajcik13	1
821f91e3-915a-43dd-89a7-8df33e522565	Glen_Krajcik13	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Glen_Krajcik13	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Glen_Krajcik13	1
69199805-05c7-4301-8c05-868f29e606d6	Glen_Krajcik13	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Glen_Krajcik13	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Glen_Krajcik13	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Glen_Krajcik13	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Glen_Krajcik13	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Glen_Krajcik13	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Glen_Krajcik13	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Glen_Krajcik13	1
532a613b-9be2-43e4-82f4-ddce03d99630	Glen_Krajcik13	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Glen_Krajcik13	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Glen_Krajcik13	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Glen_Krajcik13	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Glen_Krajcik13	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Glen_Krajcik13	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Glen_Krajcik13	1
9f20d789-935c-4109-b05a-3077a29eb1df	Glen_Krajcik13	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Glen_Krajcik13	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Glen_Krajcik13	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Glen_Krajcik13	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Glen_Krajcik13	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Glen_Krajcik13	1
fc65f17f-c071-4362-b9bd-4db4308da997	Glen_Krajcik13	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Glen_Krajcik13	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Glen_Krajcik13	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Glen_Krajcik13	1
36858a27-3c56-46c8-af27-984828aebb98	Glen_Krajcik13	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Glen_Krajcik13	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Glen_Krajcik13	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Glen_Krajcik13	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Glen_Krajcik13	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Glen_Krajcik13	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Glen_Krajcik13	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Glen_Krajcik13	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Glen_Krajcik13	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Glen_Krajcik13	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Glen_Krajcik13	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Glen_Krajcik13	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Glen_Krajcik13	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Glen_Krajcik13	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Glen_Krajcik13	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Glen_Krajcik13	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Glen_Krajcik13	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Glen_Krajcik13	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Glen_Krajcik13	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Glen_Krajcik13	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Glen_Krajcik13	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Glen_Krajcik13	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Glen_Krajcik13	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Glen_Krajcik13	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Glen_Krajcik13	-1
62978666-53c0-4edb-a671-19efd6e9457a	Glen_Krajcik13	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Glen_Krajcik13	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Glen_Krajcik13	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Glen_Krajcik13	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Glen_Krajcik13	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Glen_Krajcik13	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Glen_Krajcik13	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Keegan_Prohaska	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Keegan_Prohaska	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Keegan_Prohaska	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Keegan_Prohaska	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Keegan_Prohaska	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Keegan_Prohaska	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Keegan_Prohaska	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Keegan_Prohaska	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Keegan_Prohaska	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Keegan_Prohaska	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Keegan_Prohaska	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Keegan_Prohaska	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Keegan_Prohaska	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Keegan_Prohaska	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Keegan_Prohaska	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Keegan_Prohaska	1
23c943e0-2ea7-42c7-9112-c77c08073122	Keegan_Prohaska	1
2508c094-ff79-4881-b756-74234df008f2	Keegan_Prohaska	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Keegan_Prohaska	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Keegan_Prohaska	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Keegan_Prohaska	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Keegan_Prohaska	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Keegan_Prohaska	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Keegan_Prohaska	1
96b2311c-d26f-4462-a29c-a94753161467	Keegan_Prohaska	1
93b57384-8822-4eee-89cc-64c16ed25a59	Keegan_Prohaska	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Keegan_Prohaska	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Keegan_Prohaska	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Keegan_Prohaska	1
1d5c2502-ca57-4203-9271-bd342aca5648	Keegan_Prohaska	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Keegan_Prohaska	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Keegan_Prohaska	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Keegan_Prohaska	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Keegan_Prohaska	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Keegan_Prohaska	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Keegan_Prohaska	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Keegan_Prohaska	1
9f20d789-935c-4109-b05a-3077a29eb1df	Keegan_Prohaska	1
020f3109-5d91-4cdc-936d-b60387e8f326	Keegan_Prohaska	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Keegan_Prohaska	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Keegan_Prohaska	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Keegan_Prohaska	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Keegan_Prohaska	1
69199805-05c7-4301-8c05-868f29e606d6	Keegan_Prohaska	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Keegan_Prohaska	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Keegan_Prohaska	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Keegan_Prohaska	1
62978666-53c0-4edb-a671-19efd6e9457a	Keegan_Prohaska	1
36858a27-3c56-46c8-af27-984828aebb98	Keegan_Prohaska	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Keegan_Prohaska	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Keegan_Prohaska	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Keegan_Prohaska	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Keegan_Prohaska	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Keegan_Prohaska	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Keegan_Prohaska	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Keegan_Prohaska	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Keegan_Prohaska	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Keegan_Prohaska	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Keegan_Prohaska	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Keegan_Prohaska	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Keegan_Prohaska	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Keegan_Prohaska	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Keegan_Prohaska	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Keegan_Prohaska	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Keegan_Prohaska	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Keegan_Prohaska	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Keegan_Prohaska	-1
821f91e3-915a-43dd-89a7-8df33e522565	Keegan_Prohaska	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Keegan_Prohaska	-1
cb2730fa-9028-467f-905d-75c229ed9879	Keegan_Prohaska	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Camila_Schiller80	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Camila_Schiller80	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Camila_Schiller80	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Camila_Schiller80	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Camila_Schiller80	1
bf75a830-7874-44ca-ab46-275c273b4c76	Camila_Schiller80	1
93b57384-8822-4eee-89cc-64c16ed25a59	Camila_Schiller80	1
9f20d789-935c-4109-b05a-3077a29eb1df	Camila_Schiller80	1
c02a050c-9299-4313-b24d-d42a6c189505	Camila_Schiller80	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Camila_Schiller80	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Camila_Schiller80	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Camila_Schiller80	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Camila_Schiller80	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Camila_Schiller80	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Camila_Schiller80	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Camila_Schiller80	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Camila_Schiller80	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Camila_Schiller80	1
2508c094-ff79-4881-b756-74234df008f2	Camila_Schiller80	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Camila_Schiller80	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Camila_Schiller80	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Camila_Schiller80	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Camila_Schiller80	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Camila_Schiller80	1
e3d32705-a4e8-4070-8224-442c946b05a8	Camila_Schiller80	1
1d5c2502-ca57-4203-9271-bd342aca5648	Camila_Schiller80	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Camila_Schiller80	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Camila_Schiller80	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Camila_Schiller80	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Camila_Schiller80	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Camila_Schiller80	1
821f91e3-915a-43dd-89a7-8df33e522565	Camila_Schiller80	1
62978666-53c0-4edb-a671-19efd6e9457a	Camila_Schiller80	1
69199805-05c7-4301-8c05-868f29e606d6	Camila_Schiller80	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Camila_Schiller80	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Camila_Schiller80	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Camila_Schiller80	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Camila_Schiller80	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Camila_Schiller80	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Camila_Schiller80	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Camila_Schiller80	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Camila_Schiller80	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Camila_Schiller80	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Camila_Schiller80	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Camila_Schiller80	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Camila_Schiller80	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Camila_Schiller80	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Camila_Schiller80	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Camila_Schiller80	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Camila_Schiller80	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Camila_Schiller80	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Camila_Schiller80	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Camila_Schiller80	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Camila_Schiller80	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Camila_Schiller80	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Camila_Schiller80	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Camila_Schiller80	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Camila_Schiller80	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Camila_Schiller80	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Camila_Schiller80	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Camila_Schiller80	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Camila_Schiller80	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Camila_Schiller80	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Camila_Schiller80	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Camila_Schiller80	-1
eb43e6c6-b016-445c-b33c-05468d203319	Camila_Schiller80	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Camila_Schiller80	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Camila_Schiller80	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Camila_Schiller80	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Camila_Schiller80	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Camila_Schiller80	-1
cb2730fa-9028-467f-905d-75c229ed9879	Camila_Schiller80	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Camila_Schiller80	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Camila_Schiller80	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Velda.OReilly24	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Velda.OReilly24	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Velda.OReilly24	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Velda.OReilly24	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Velda.OReilly24	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Velda.OReilly24	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Velda.OReilly24	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Velda.OReilly24	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Velda.OReilly24	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Velda.OReilly24	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Velda.OReilly24	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Velda.OReilly24	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Velda.OReilly24	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Velda.OReilly24	1
020f3109-5d91-4cdc-936d-b60387e8f326	Velda.OReilly24	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Velda.OReilly24	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Velda.OReilly24	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Velda.OReilly24	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Velda.OReilly24	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Velda.OReilly24	1
36858a27-3c56-46c8-af27-984828aebb98	Velda.OReilly24	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Velda.OReilly24	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Velda.OReilly24	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Velda.OReilly24	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Velda.OReilly24	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Velda.OReilly24	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Velda.OReilly24	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Velda.OReilly24	1
821f91e3-915a-43dd-89a7-8df33e522565	Velda.OReilly24	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Velda.OReilly24	1
cb2730fa-9028-467f-905d-75c229ed9879	Velda.OReilly24	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Velda.OReilly24	1
62978666-53c0-4edb-a671-19efd6e9457a	Velda.OReilly24	1
c7594724-4e46-48bf-b545-dde115e92a96	Velda.OReilly24	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Velda.OReilly24	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Velda.OReilly24	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Velda.OReilly24	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Velda.OReilly24	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Velda.OReilly24	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Velda.OReilly24	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Velda.OReilly24	1
93b57384-8822-4eee-89cc-64c16ed25a59	Velda.OReilly24	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Velda.OReilly24	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Velda.OReilly24	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Velda.OReilly24	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Velda.OReilly24	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Velda.OReilly24	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Velda.OReilly24	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Velda.OReilly24	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Velda.OReilly24	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Velda.OReilly24	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Velda.OReilly24	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Velda.OReilly24	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Velda.OReilly24	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Velda.OReilly24	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Velda.OReilly24	1
eb43e6c6-b016-445c-b33c-05468d203319	Velda.OReilly24	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Velda.OReilly24	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Velda.OReilly24	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Velda.OReilly24	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Velda.OReilly24	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Velda.OReilly24	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Velda.OReilly24	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Velda.OReilly24	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Velda.OReilly24	-1
69199805-05c7-4301-8c05-868f29e606d6	Velda.OReilly24	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Velda.OReilly24	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Velda.OReilly24	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Velda.OReilly24	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Velda.OReilly24	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Velda.OReilly24	-1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Velda.OReilly24	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Velda.OReilly24	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Velda.OReilly24	-1
cb2730fa-9028-467f-905d-75c229ed9879	Bridie.Kilback	1
532a613b-9be2-43e4-82f4-ddce03d99630	Bridie.Kilback	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Bridie.Kilback	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Bridie.Kilback	1
62978666-53c0-4edb-a671-19efd6e9457a	Bridie.Kilback	1
c7594724-4e46-48bf-b545-dde115e92a96	Bridie.Kilback	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Bridie.Kilback	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Bridie.Kilback	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Bridie.Kilback	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Bridie.Kilback	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Bridie.Kilback	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Bridie.Kilback	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Bridie.Kilback	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Bridie.Kilback	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Bridie.Kilback	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Bridie.Kilback	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Bridie.Kilback	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Bridie.Kilback	1
93b57384-8822-4eee-89cc-64c16ed25a59	Bridie.Kilback	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Bridie.Kilback	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Bridie.Kilback	1
821f91e3-915a-43dd-89a7-8df33e522565	Bridie.Kilback	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Bridie.Kilback	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Bridie.Kilback	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Bridie.Kilback	1
fc65f17f-c071-4362-b9bd-4db4308da997	Bridie.Kilback	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Bridie.Kilback	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Bridie.Kilback	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Bridie.Kilback	1
020f3109-5d91-4cdc-936d-b60387e8f326	Bridie.Kilback	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Bridie.Kilback	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Bridie.Kilback	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Bridie.Kilback	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Bridie.Kilback	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Bridie.Kilback	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Bridie.Kilback	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Bridie.Kilback	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Bridie.Kilback	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Bridie.Kilback	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Bridie.Kilback	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Bridie.Kilback	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Bridie.Kilback	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Bridie.Kilback	1
9f20d789-935c-4109-b05a-3077a29eb1df	Bridie.Kilback	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Bridie.Kilback	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Bridie.Kilback	1
e3d32705-a4e8-4070-8224-442c946b05a8	Bridie.Kilback	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Bridie.Kilback	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Bridie.Kilback	1
2508c094-ff79-4881-b756-74234df008f2	Bridie.Kilback	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Bridie.Kilback	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Bridie.Kilback	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Bridie.Kilback	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Bridie.Kilback	-1
71987b86-bbec-457b-a2d9-c1b3257dd876	Bridie.Kilback	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Bridie.Kilback	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Bridie.Kilback	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Bridie.Kilback	-1
eb43e6c6-b016-445c-b33c-05468d203319	Bridie.Kilback	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Bridie.Kilback	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Bridie.Kilback	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Bridie.Kilback	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Bridie.Kilback	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Bridie.Kilback	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Bridie.Kilback	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Bridie.Kilback	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Velda_Davis	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Velda_Davis	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Velda_Davis	1
cb2730fa-9028-467f-905d-75c229ed9879	Velda_Davis	1
9f20d789-935c-4109-b05a-3077a29eb1df	Velda_Davis	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Velda_Davis	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Velda_Davis	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Velda_Davis	1
69199805-05c7-4301-8c05-868f29e606d6	Velda_Davis	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Velda_Davis	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Velda_Davis	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Velda_Davis	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Velda_Davis	1
eb43e6c6-b016-445c-b33c-05468d203319	Velda_Davis	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Velda_Davis	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Velda_Davis	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Velda_Davis	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Velda_Davis	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Velda_Davis	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Velda_Davis	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Velda_Davis	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Velda_Davis	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Velda_Davis	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Velda_Davis	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Velda_Davis	1
96b2311c-d26f-4462-a29c-a94753161467	Velda_Davis	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Velda_Davis	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Velda_Davis	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Velda_Davis	1
2508c094-ff79-4881-b756-74234df008f2	Velda_Davis	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Velda_Davis	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Velda_Davis	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Velda_Davis	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Velda_Davis	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Velda_Davis	1
821f91e3-915a-43dd-89a7-8df33e522565	Velda_Davis	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Velda_Davis	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Velda_Davis	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Velda_Davis	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Velda_Davis	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Velda_Davis	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Velda_Davis	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Velda_Davis	1
020f3109-5d91-4cdc-936d-b60387e8f326	Velda_Davis	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Velda_Davis	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Velda_Davis	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Velda_Davis	1
fc65f17f-c071-4362-b9bd-4db4308da997	Velda_Davis	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Velda_Davis	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Velda_Davis	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Velda_Davis	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Velda_Davis	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Velda_Davis	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Velda_Davis	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Velda_Davis	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Velda_Davis	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Velda_Davis	1
23c943e0-2ea7-42c7-9112-c77c08073122	Velda_Davis	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Velda_Davis	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Velda_Davis	1
1d5c2502-ca57-4203-9271-bd342aca5648	Velda_Davis	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Velda_Davis	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Velda_Davis	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Velda_Davis	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Velda_Davis	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Velda_Davis	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Velda_Davis	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Velda_Davis	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Velda_Davis	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Velda_Davis	-1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Velda_Davis	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Velda_Davis	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Velda_Davis	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Velda_Davis	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Velda_Davis	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Velda_Davis	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Velda_Davis	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Velda_Davis	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Velda_Davis	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Veronica36	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Veronica36	1
c7594724-4e46-48bf-b545-dde115e92a96	Veronica36	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Veronica36	1
96b2311c-d26f-4462-a29c-a94753161467	Veronica36	1
532a613b-9be2-43e4-82f4-ddce03d99630	Veronica36	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Veronica36	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Veronica36	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Veronica36	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Veronica36	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Veronica36	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Veronica36	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Veronica36	1
2508c094-ff79-4881-b756-74234df008f2	Veronica36	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Veronica36	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Veronica36	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Veronica36	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Veronica36	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Veronica36	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Veronica36	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Veronica36	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Veronica36	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Veronica36	1
bf75a830-7874-44ca-ab46-275c273b4c76	Veronica36	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Veronica36	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Veronica36	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Veronica36	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Veronica36	1
821f91e3-915a-43dd-89a7-8df33e522565	Veronica36	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Veronica36	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Veronica36	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Veronica36	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Veronica36	1
23c943e0-2ea7-42c7-9112-c77c08073122	Veronica36	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Veronica36	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Veronica36	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Veronica36	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Veronica36	1
e3d32705-a4e8-4070-8224-442c946b05a8	Veronica36	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Veronica36	1
020f3109-5d91-4cdc-936d-b60387e8f326	Veronica36	1
fc65f17f-c071-4362-b9bd-4db4308da997	Veronica36	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Veronica36	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Veronica36	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Veronica36	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Veronica36	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Veronica36	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Veronica36	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Veronica36	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Veronica36	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Veronica36	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Veronica36	1
93b57384-8822-4eee-89cc-64c16ed25a59	Veronica36	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Veronica36	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Veronica36	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Veronica36	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Veronica36	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Veronica36	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Veronica36	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Veronica36	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Veronica36	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Veronica36	-1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Veronica36	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Veronica36	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Veronica36	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Veronica36	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Veronica36	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Veronica36	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Veronica36	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Veronica36	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Veronica36	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Veronica36	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Veronica36	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Veronica36	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Veronica36	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Veronica36	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Wendell.Greenholt	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Wendell.Greenholt	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Wendell.Greenholt	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Wendell.Greenholt	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Wendell.Greenholt	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Wendell.Greenholt	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Wendell.Greenholt	1
62978666-53c0-4edb-a671-19efd6e9457a	Wendell.Greenholt	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Wendell.Greenholt	1
9f20d789-935c-4109-b05a-3077a29eb1df	Wendell.Greenholt	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Wendell.Greenholt	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Wendell.Greenholt	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Wendell.Greenholt	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Wendell.Greenholt	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Wendell.Greenholt	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Wendell.Greenholt	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Wendell.Greenholt	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Wendell.Greenholt	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Wendell.Greenholt	1
532a613b-9be2-43e4-82f4-ddce03d99630	Wendell.Greenholt	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Wendell.Greenholt	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Wendell.Greenholt	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Wendell.Greenholt	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Wendell.Greenholt	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Wendell.Greenholt	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Wendell.Greenholt	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Wendell.Greenholt	1
7e73540b-772a-49d9-b5c1-49c000461d56	Wendell.Greenholt	1
98d76875-65d1-403b-9f65-e1b77fb25903	Wendell.Greenholt	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Wendell.Greenholt	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Wendell.Greenholt	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Wendell.Greenholt	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Wendell.Greenholt	1
2508c094-ff79-4881-b756-74234df008f2	Wendell.Greenholt	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Wendell.Greenholt	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Wendell.Greenholt	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Wendell.Greenholt	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Wendell.Greenholt	1
020f3109-5d91-4cdc-936d-b60387e8f326	Wendell.Greenholt	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Wendell.Greenholt	1
821f91e3-915a-43dd-89a7-8df33e522565	Wendell.Greenholt	1
eb43e6c6-b016-445c-b33c-05468d203319	Wendell.Greenholt	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Wendell.Greenholt	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Wendell.Greenholt	1
c7594724-4e46-48bf-b545-dde115e92a96	Wendell.Greenholt	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Wendell.Greenholt	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Wendell.Greenholt	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Wendell.Greenholt	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Wendell.Greenholt	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Wendell.Greenholt	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Wendell.Greenholt	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Wendell.Greenholt	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Wendell.Greenholt	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Wendell.Greenholt	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Wendell.Greenholt	1
36858a27-3c56-46c8-af27-984828aebb98	Wendell.Greenholt	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Wendell.Greenholt	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Wendell.Greenholt	1
1d5c2502-ca57-4203-9271-bd342aca5648	Wendell.Greenholt	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Wendell.Greenholt	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Wendell.Greenholt	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Wendell.Greenholt	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Wendell.Greenholt	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Wendell.Greenholt	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Wendell.Greenholt	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Wendell.Greenholt	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Wendell.Greenholt	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Wendell.Greenholt	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Wendell.Greenholt	-1
96b2311c-d26f-4462-a29c-a94753161467	Wendell.Greenholt	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Wendell.Greenholt	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Wendell.Greenholt	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Wendell.Greenholt	-1
cb2730fa-9028-467f-905d-75c229ed9879	Wendell.Greenholt	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Wendell.Greenholt	-1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Wendell.Greenholt	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Mathew82	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Mathew82	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Mathew82	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Mathew82	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Mathew82	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Mathew82	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Mathew82	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Mathew82	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Mathew82	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Mathew82	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Mathew82	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Mathew82	1
98d76875-65d1-403b-9f65-e1b77fb25903	Mathew82	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Mathew82	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Mathew82	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Mathew82	1
eb43e6c6-b016-445c-b33c-05468d203319	Mathew82	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Mathew82	1
e3d32705-a4e8-4070-8224-442c946b05a8	Mathew82	1
9f20d789-935c-4109-b05a-3077a29eb1df	Mathew82	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Mathew82	1
cb2730fa-9028-467f-905d-75c229ed9879	Mathew82	1
96b2311c-d26f-4462-a29c-a94753161467	Mathew82	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Mathew82	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Mathew82	1
c7594724-4e46-48bf-b545-dde115e92a96	Mathew82	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Mathew82	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Mathew82	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Mathew82	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Mathew82	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Mathew82	1
532a613b-9be2-43e4-82f4-ddce03d99630	Mathew82	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Mathew82	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Mathew82	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Mathew82	1
bf75a830-7874-44ca-ab46-275c273b4c76	Mathew82	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Mathew82	1
821f91e3-915a-43dd-89a7-8df33e522565	Mathew82	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Mathew82	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Mathew82	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Mathew82	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Mathew82	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Mathew82	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Mathew82	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Mathew82	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Mathew82	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Mathew82	1
62978666-53c0-4edb-a671-19efd6e9457a	Mathew82	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Mathew82	1
93b57384-8822-4eee-89cc-64c16ed25a59	Mathew82	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Mathew82	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Mathew82	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Mathew82	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Mathew82	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Mathew82	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Mathew82	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Mathew82	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Mathew82	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Mathew82	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Mathew82	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Mathew82	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Mathew82	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Mathew82	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Mathew82	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Mathew82	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Mathew82	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Mathew82	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Mathew82	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Mathew82	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Mathew82	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Mathew82	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Mathew82	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Mathew82	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Mathew82	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Mathew82	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Mathew82	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Mathew82	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Mathew82	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Herta18	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Herta18	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Herta18	1
c02a050c-9299-4313-b24d-d42a6c189505	Herta18	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Herta18	1
e3d32705-a4e8-4070-8224-442c946b05a8	Herta18	1
c7594724-4e46-48bf-b545-dde115e92a96	Herta18	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Herta18	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Herta18	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Herta18	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Herta18	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Herta18	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Herta18	1
020f3109-5d91-4cdc-936d-b60387e8f326	Herta18	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Herta18	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Herta18	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Herta18	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Herta18	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Herta18	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Herta18	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Herta18	1
eb43e6c6-b016-445c-b33c-05468d203319	Herta18	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Herta18	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Herta18	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Herta18	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Herta18	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Herta18	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Herta18	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Herta18	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Herta18	1
23c943e0-2ea7-42c7-9112-c77c08073122	Herta18	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Herta18	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Herta18	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Herta18	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Herta18	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Herta18	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Herta18	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Herta18	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Herta18	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Herta18	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Herta18	1
821f91e3-915a-43dd-89a7-8df33e522565	Herta18	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Herta18	1
93b57384-8822-4eee-89cc-64c16ed25a59	Herta18	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Herta18	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Herta18	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Herta18	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Herta18	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Herta18	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Herta18	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Herta18	1
9f20d789-935c-4109-b05a-3077a29eb1df	Herta18	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Herta18	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Herta18	-1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Herta18	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Herta18	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Herta18	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Herta18	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Herta18	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Herta18	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Herta18	-1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Herta18	-1
cb2730fa-9028-467f-905d-75c229ed9879	Herta18	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Herta18	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Herta18	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Herta18	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Herta18	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Kailyn_Wehner6	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Kailyn_Wehner6	1
1d5c2502-ca57-4203-9271-bd342aca5648	Kailyn_Wehner6	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Kailyn_Wehner6	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Kailyn_Wehner6	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Kailyn_Wehner6	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Kailyn_Wehner6	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Kailyn_Wehner6	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Kailyn_Wehner6	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Kailyn_Wehner6	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Kailyn_Wehner6	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Kailyn_Wehner6	1
36858a27-3c56-46c8-af27-984828aebb98	Kailyn_Wehner6	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Kailyn_Wehner6	1
020f3109-5d91-4cdc-936d-b60387e8f326	Kailyn_Wehner6	1
7e73540b-772a-49d9-b5c1-49c000461d56	Kailyn_Wehner6	1
c02a050c-9299-4313-b24d-d42a6c189505	Kailyn_Wehner6	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Kailyn_Wehner6	1
c7594724-4e46-48bf-b545-dde115e92a96	Kailyn_Wehner6	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Kailyn_Wehner6	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Kailyn_Wehner6	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Kailyn_Wehner6	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Kailyn_Wehner6	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Kailyn_Wehner6	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Kailyn_Wehner6	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Kailyn_Wehner6	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Kailyn_Wehner6	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Kailyn_Wehner6	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Kailyn_Wehner6	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Kailyn_Wehner6	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Kailyn_Wehner6	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Kailyn_Wehner6	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Kailyn_Wehner6	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Kailyn_Wehner6	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Kailyn_Wehner6	1
fc65f17f-c071-4362-b9bd-4db4308da997	Kailyn_Wehner6	1
93b57384-8822-4eee-89cc-64c16ed25a59	Kailyn_Wehner6	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Kailyn_Wehner6	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Kailyn_Wehner6	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Kailyn_Wehner6	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Kailyn_Wehner6	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Kailyn_Wehner6	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Kailyn_Wehner6	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Kailyn_Wehner6	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Kailyn_Wehner6	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Kailyn_Wehner6	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Kailyn_Wehner6	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Kailyn_Wehner6	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Kailyn_Wehner6	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Kailyn_Wehner6	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Kailyn_Wehner6	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Kailyn_Wehner6	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Kailyn_Wehner6	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Kailyn_Wehner6	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Kailyn_Wehner6	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Kailyn_Wehner6	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Kailyn_Wehner6	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Kailyn_Wehner6	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Kailyn_Wehner6	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Kailyn_Wehner6	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Kailyn_Wehner6	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Kailyn_Wehner6	-1
62978666-53c0-4edb-a671-19efd6e9457a	Kailyn_Wehner6	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Kailyn_Wehner6	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Kailyn_Wehner6	-1
821f91e3-915a-43dd-89a7-8df33e522565	Kailyn_Wehner6	-1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Kailyn_Wehner6	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Kailyn_Wehner6	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Kailyn_Wehner6	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Rosa.Howe52	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Rosa.Howe52	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Rosa.Howe52	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Rosa.Howe52	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Rosa.Howe52	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Rosa.Howe52	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Rosa.Howe52	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Rosa.Howe52	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Rosa.Howe52	1
bf75a830-7874-44ca-ab46-275c273b4c76	Rosa.Howe52	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Rosa.Howe52	1
69199805-05c7-4301-8c05-868f29e606d6	Rosa.Howe52	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Rosa.Howe52	1
9f20d789-935c-4109-b05a-3077a29eb1df	Rosa.Howe52	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Rosa.Howe52	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Rosa.Howe52	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Rosa.Howe52	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Rosa.Howe52	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Rosa.Howe52	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Rosa.Howe52	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Rosa.Howe52	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Rosa.Howe52	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Rosa.Howe52	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Rosa.Howe52	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Rosa.Howe52	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Rosa.Howe52	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Rosa.Howe52	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Rosa.Howe52	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Rosa.Howe52	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Rosa.Howe52	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Rosa.Howe52	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Rosa.Howe52	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Rosa.Howe52	1
532a613b-9be2-43e4-82f4-ddce03d99630	Rosa.Howe52	1
c7594724-4e46-48bf-b545-dde115e92a96	Rosa.Howe52	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Rosa.Howe52	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Rosa.Howe52	1
cb2730fa-9028-467f-905d-75c229ed9879	Rosa.Howe52	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Rosa.Howe52	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Rosa.Howe52	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Rosa.Howe52	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Rosa.Howe52	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Rosa.Howe52	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Rosa.Howe52	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Rosa.Howe52	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Rosa.Howe52	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Rosa.Howe52	1
020f3109-5d91-4cdc-936d-b60387e8f326	Rosa.Howe52	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Rosa.Howe52	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Rosa.Howe52	1
98d76875-65d1-403b-9f65-e1b77fb25903	Rosa.Howe52	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Rosa.Howe52	1
2508c094-ff79-4881-b756-74234df008f2	Rosa.Howe52	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Rosa.Howe52	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Rosa.Howe52	1
821f91e3-915a-43dd-89a7-8df33e522565	Rosa.Howe52	-1
62978666-53c0-4edb-a671-19efd6e9457a	Rosa.Howe52	-1
eb43e6c6-b016-445c-b33c-05468d203319	Rosa.Howe52	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Rosa.Howe52	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Rosa.Howe52	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Rosa.Howe52	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Rosa.Howe52	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Rosa.Howe52	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Rosa.Howe52	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Rosa.Howe52	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Rosa.Howe52	-1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Rosa.Howe52	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Rosa.Howe52	-1
c02a050c-9299-4313-b24d-d42a6c189505	Rosa.Howe52	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Rosa.Howe52	-1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Rosa.Howe52	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Rosa.Howe52	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Rosa.Howe52	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Rosa.Howe52	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Rosa.Howe52	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Rosa.Howe52	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Rosa.Howe52	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Gustave.Murazik27	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Gustave.Murazik27	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Gustave.Murazik27	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Gustave.Murazik27	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Gustave.Murazik27	1
020f3109-5d91-4cdc-936d-b60387e8f326	Gustave.Murazik27	1
e3d32705-a4e8-4070-8224-442c946b05a8	Gustave.Murazik27	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Gustave.Murazik27	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Gustave.Murazik27	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Gustave.Murazik27	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Gustave.Murazik27	1
62978666-53c0-4edb-a671-19efd6e9457a	Gustave.Murazik27	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Gustave.Murazik27	1
fc65f17f-c071-4362-b9bd-4db4308da997	Gustave.Murazik27	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Gustave.Murazik27	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Gustave.Murazik27	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Gustave.Murazik27	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Gustave.Murazik27	1
532a613b-9be2-43e4-82f4-ddce03d99630	Gustave.Murazik27	1
c7594724-4e46-48bf-b545-dde115e92a96	Gustave.Murazik27	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Gustave.Murazik27	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Gustave.Murazik27	1
9f20d789-935c-4109-b05a-3077a29eb1df	Gustave.Murazik27	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Gustave.Murazik27	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Gustave.Murazik27	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Gustave.Murazik27	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Gustave.Murazik27	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Gustave.Murazik27	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Gustave.Murazik27	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Gustave.Murazik27	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Gustave.Murazik27	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Gustave.Murazik27	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Gustave.Murazik27	1
7e73540b-772a-49d9-b5c1-49c000461d56	Gustave.Murazik27	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Gustave.Murazik27	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Gustave.Murazik27	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Gustave.Murazik27	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Gustave.Murazik27	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Gustave.Murazik27	1
eb43e6c6-b016-445c-b33c-05468d203319	Gustave.Murazik27	1
cb2730fa-9028-467f-905d-75c229ed9879	Gustave.Murazik27	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Gustave.Murazik27	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Gustave.Murazik27	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Gustave.Murazik27	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Gustave.Murazik27	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Gustave.Murazik27	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Gustave.Murazik27	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Gustave.Murazik27	1
93b57384-8822-4eee-89cc-64c16ed25a59	Gustave.Murazik27	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Gustave.Murazik27	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Gustave.Murazik27	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Gustave.Murazik27	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Gustave.Murazik27	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Gustave.Murazik27	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Gustave.Murazik27	1
96b2311c-d26f-4462-a29c-a94753161467	Gustave.Murazik27	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Gustave.Murazik27	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Gustave.Murazik27	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Gustave.Murazik27	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Gustave.Murazik27	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Gustave.Murazik27	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Gustave.Murazik27	-1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Gustave.Murazik27	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Gustave.Murazik27	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Gustave.Murazik27	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Gustave.Murazik27	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Gustave.Murazik27	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Gustave.Murazik27	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Gustave.Murazik27	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Gustave.Murazik27	-1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Gustave.Murazik27	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Gustave.Murazik27	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Gustave.Murazik27	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Gustave.Murazik27	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Kali.Moen	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Kali.Moen	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Kali.Moen	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Kali.Moen	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Kali.Moen	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Kali.Moen	1
fc65f17f-c071-4362-b9bd-4db4308da997	Kali.Moen	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Kali.Moen	1
36858a27-3c56-46c8-af27-984828aebb98	Kali.Moen	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Kali.Moen	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Kali.Moen	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Kali.Moen	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Kali.Moen	1
23c943e0-2ea7-42c7-9112-c77c08073122	Kali.Moen	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Kali.Moen	1
96b2311c-d26f-4462-a29c-a94753161467	Kali.Moen	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Kali.Moen	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Kali.Moen	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Kali.Moen	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Kali.Moen	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Kali.Moen	1
93b57384-8822-4eee-89cc-64c16ed25a59	Kali.Moen	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Kali.Moen	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Kali.Moen	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Kali.Moen	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Kali.Moen	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Kali.Moen	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Kali.Moen	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Kali.Moen	1
020f3109-5d91-4cdc-936d-b60387e8f326	Kali.Moen	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Kali.Moen	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Kali.Moen	1
98d76875-65d1-403b-9f65-e1b77fb25903	Kali.Moen	1
2508c094-ff79-4881-b756-74234df008f2	Kali.Moen	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Kali.Moen	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Kali.Moen	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Kali.Moen	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Kali.Moen	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Kali.Moen	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Kali.Moen	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Kali.Moen	1
cb2730fa-9028-467f-905d-75c229ed9879	Kali.Moen	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Kali.Moen	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Kali.Moen	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Kali.Moen	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Kali.Moen	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Kali.Moen	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Kali.Moen	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Kali.Moen	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Kali.Moen	1
bf75a830-7874-44ca-ab46-275c273b4c76	Kali.Moen	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Kali.Moen	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Kali.Moen	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Kali.Moen	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Kali.Moen	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Kali.Moen	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Kali.Moen	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Kali.Moen	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Kali.Moen	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Kali.Moen	-1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Kali.Moen	-1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Kali.Moen	-1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Kali.Moen	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Kali.Moen	-1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Kali.Moen	-1
9f20d789-935c-4109-b05a-3077a29eb1df	Kali.Moen	-1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Kali.Moen	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Kali.Moen	-1
69199805-05c7-4301-8c05-868f29e606d6	Kali.Moen	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Kali.Moen	-1
821f91e3-915a-43dd-89a7-8df33e522565	Kali.Moen	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Kali.Moen	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Kali.Moen	-1
970eed6e-3a47-42a9-b90b-a3c049f96751	Sarina58	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Sarina58	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Sarina58	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Sarina58	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Sarina58	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Sarina58	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Sarina58	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Sarina58	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Sarina58	1
2508c094-ff79-4881-b756-74234df008f2	Sarina58	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Sarina58	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Sarina58	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Sarina58	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Sarina58	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Sarina58	1
c02a050c-9299-4313-b24d-d42a6c189505	Sarina58	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Sarina58	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Sarina58	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Sarina58	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Sarina58	1
93b57384-8822-4eee-89cc-64c16ed25a59	Sarina58	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Sarina58	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Sarina58	1
69199805-05c7-4301-8c05-868f29e606d6	Sarina58	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Sarina58	1
98d76875-65d1-403b-9f65-e1b77fb25903	Sarina58	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Sarina58	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Sarina58	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Sarina58	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Sarina58	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Sarina58	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Sarina58	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Sarina58	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Sarina58	1
532a613b-9be2-43e4-82f4-ddce03d99630	Sarina58	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Sarina58	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Sarina58	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Sarina58	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Sarina58	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Sarina58	1
7e73540b-772a-49d9-b5c1-49c000461d56	Sarina58	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Sarina58	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Sarina58	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Sarina58	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Sarina58	1
eb43e6c6-b016-445c-b33c-05468d203319	Sarina58	1
36858a27-3c56-46c8-af27-984828aebb98	Sarina58	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Sarina58	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Sarina58	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Sarina58	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Sarina58	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Sarina58	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Sarina58	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Sarina58	1
62978666-53c0-4edb-a671-19efd6e9457a	Sarina58	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Sarina58	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Sarina58	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Sarina58	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Sarina58	-1
c7594724-4e46-48bf-b545-dde115e92a96	Sarina58	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Sarina58	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Sarina58	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Sarina58	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Sarina58	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Sarina58	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Sarina58	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Sarina58	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Sarina58	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Sarina58	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Sarina58	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Sarina58	-1
1d5c2502-ca57-4203-9271-bd342aca5648	Sarina58	-1
cb2730fa-9028-467f-905d-75c229ed9879	Sarina58	-1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Orlando43	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Orlando43	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Orlando43	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Orlando43	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Orlando43	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Orlando43	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Orlando43	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Orlando43	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Orlando43	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Orlando43	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Orlando43	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Orlando43	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Orlando43	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Orlando43	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Orlando43	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Orlando43	1
fc65f17f-c071-4362-b9bd-4db4308da997	Orlando43	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Orlando43	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Orlando43	1
36858a27-3c56-46c8-af27-984828aebb98	Orlando43	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Orlando43	1
23c943e0-2ea7-42c7-9112-c77c08073122	Orlando43	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Orlando43	1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Orlando43	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Orlando43	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Orlando43	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Orlando43	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Orlando43	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Orlando43	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Orlando43	1
9f20d789-935c-4109-b05a-3077a29eb1df	Orlando43	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Orlando43	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Orlando43	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Orlando43	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Orlando43	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Orlando43	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Orlando43	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Orlando43	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Orlando43	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Orlando43	1
cb2730fa-9028-467f-905d-75c229ed9879	Orlando43	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Orlando43	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Orlando43	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Orlando43	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Orlando43	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Orlando43	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Orlando43	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Orlando43	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Orlando43	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Orlando43	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Orlando43	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Orlando43	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Orlando43	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Orlando43	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Orlando43	1
bf75a830-7874-44ca-ab46-275c273b4c76	Orlando43	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Orlando43	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Orlando43	1
532a613b-9be2-43e4-82f4-ddce03d99630	Orlando43	1
eb43e6c6-b016-445c-b33c-05468d203319	Orlando43	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Orlando43	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Orlando43	-1
93b57384-8822-4eee-89cc-64c16ed25a59	Orlando43	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Orlando43	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Orlando43	-1
c7594724-4e46-48bf-b545-dde115e92a96	Orlando43	-1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Orlando43	-1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Orlando43	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Orlando43	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Orlando43	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Orlando43	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Orlando43	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Dejon.Mante0	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Dejon.Mante0	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Dejon.Mante0	1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Dejon.Mante0	1
532a613b-9be2-43e4-82f4-ddce03d99630	Dejon.Mante0	1
821f91e3-915a-43dd-89a7-8df33e522565	Dejon.Mante0	1
c02a050c-9299-4313-b24d-d42a6c189505	Dejon.Mante0	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Dejon.Mante0	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Dejon.Mante0	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Dejon.Mante0	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Dejon.Mante0	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Dejon.Mante0	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Dejon.Mante0	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Dejon.Mante0	1
69199805-05c7-4301-8c05-868f29e606d6	Dejon.Mante0	1
eb43e6c6-b016-445c-b33c-05468d203319	Dejon.Mante0	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Dejon.Mante0	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Dejon.Mante0	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Dejon.Mante0	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Dejon.Mante0	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Dejon.Mante0	1
bf75a830-7874-44ca-ab46-275c273b4c76	Dejon.Mante0	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Dejon.Mante0	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Dejon.Mante0	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Dejon.Mante0	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Dejon.Mante0	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Dejon.Mante0	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Dejon.Mante0	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Dejon.Mante0	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Dejon.Mante0	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Dejon.Mante0	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Dejon.Mante0	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Dejon.Mante0	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Dejon.Mante0	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Dejon.Mante0	1
fc65f17f-c071-4362-b9bd-4db4308da997	Dejon.Mante0	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Dejon.Mante0	1
cb2730fa-9028-467f-905d-75c229ed9879	Dejon.Mante0	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Dejon.Mante0	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Dejon.Mante0	1
020f3109-5d91-4cdc-936d-b60387e8f326	Dejon.Mante0	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Dejon.Mante0	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Dejon.Mante0	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Dejon.Mante0	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Dejon.Mante0	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Dejon.Mante0	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Dejon.Mante0	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Dejon.Mante0	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Dejon.Mante0	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Dejon.Mante0	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Dejon.Mante0	1
1d5c2502-ca57-4203-9271-bd342aca5648	Dejon.Mante0	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Dejon.Mante0	1
93b57384-8822-4eee-89cc-64c16ed25a59	Dejon.Mante0	1
9f20d789-935c-4109-b05a-3077a29eb1df	Dejon.Mante0	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Dejon.Mante0	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Dejon.Mante0	1
e3d32705-a4e8-4070-8224-442c946b05a8	Dejon.Mante0	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Dejon.Mante0	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Dejon.Mante0	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Dejon.Mante0	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Dejon.Mante0	-1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Dejon.Mante0	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Dejon.Mante0	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Dejon.Mante0	-1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Dejon.Mante0	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Dejon.Mante0	-1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Dejon.Mante0	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Dejon.Mante0	-1
c000d026-2e11-4d5d-b4aa-c533bf769016	Dejon.Mante0	-1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Dejon.Mante0	-1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Dejon.Mante0	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Dejon.Mante0	-1
23c943e0-2ea7-42c7-9112-c77c08073122	Dejon.Mante0	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Dejon.Mante0	-1
2508c094-ff79-4881-b756-74234df008f2	Dejon.Mante0	-1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Dejon.Mante0	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Dejon.Mante0	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Dejon.Mante0	-1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Dejon.Mante0	-1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Willa15	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Willa15	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Willa15	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Willa15	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Willa15	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Willa15	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Willa15	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Willa15	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Willa15	1
e3d32705-a4e8-4070-8224-442c946b05a8	Willa15	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Willa15	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Willa15	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Willa15	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Willa15	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Willa15	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Willa15	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Willa15	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Willa15	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Willa15	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Willa15	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Willa15	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Willa15	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Willa15	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Willa15	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Willa15	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Willa15	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Willa15	1
532a613b-9be2-43e4-82f4-ddce03d99630	Willa15	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Willa15	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Willa15	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Willa15	1
821f91e3-915a-43dd-89a7-8df33e522565	Willa15	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Willa15	1
c02a050c-9299-4313-b24d-d42a6c189505	Willa15	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Willa15	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Willa15	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Willa15	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Willa15	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Willa15	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Willa15	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Willa15	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Willa15	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Willa15	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Willa15	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Willa15	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Willa15	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Willa15	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Willa15	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Willa15	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Willa15	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Willa15	1
7e73540b-772a-49d9-b5c1-49c000461d56	Willa15	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Willa15	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Willa15	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Willa15	1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Willa15	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Willa15	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Willa15	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Willa15	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Willa15	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Willa15	-1
69199805-05c7-4301-8c05-868f29e606d6	Willa15	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Willa15	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Willa15	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Willa15	-1
e6030f49-4156-4c69-8aed-805cb4f8382a	Willa15	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Willa15	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Willa15	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Willa15	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Willa15	-1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Willa15	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Willa15	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Willa15	-1
eb9c21ab-a064-4de9-921d-c059814f81c7	Willa15	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Willa15	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Willa15	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Willa15	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Willa15	-1
2508c094-ff79-4881-b756-74234df008f2	Willa15	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Willa15	-1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Willa15	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Sunny_Anderson	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Sunny_Anderson	1
6e9d3106-eb15-4d80-9c08-c819a0189623	Sunny_Anderson	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Sunny_Anderson	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Sunny_Anderson	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Sunny_Anderson	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Sunny_Anderson	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Sunny_Anderson	1
e3d32705-a4e8-4070-8224-442c946b05a8	Sunny_Anderson	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Sunny_Anderson	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Sunny_Anderson	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Sunny_Anderson	1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Sunny_Anderson	1
62978666-53c0-4edb-a671-19efd6e9457a	Sunny_Anderson	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Sunny_Anderson	1
9f20d789-935c-4109-b05a-3077a29eb1df	Sunny_Anderson	1
cb2730fa-9028-467f-905d-75c229ed9879	Sunny_Anderson	1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Sunny_Anderson	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Sunny_Anderson	1
7e73540b-772a-49d9-b5c1-49c000461d56	Sunny_Anderson	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Sunny_Anderson	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Sunny_Anderson	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Sunny_Anderson	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Sunny_Anderson	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Sunny_Anderson	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Sunny_Anderson	1
98d76875-65d1-403b-9f65-e1b77fb25903	Sunny_Anderson	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Sunny_Anderson	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Sunny_Anderson	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Sunny_Anderson	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Sunny_Anderson	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Sunny_Anderson	1
c02a050c-9299-4313-b24d-d42a6c189505	Sunny_Anderson	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Sunny_Anderson	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Sunny_Anderson	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Sunny_Anderson	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Sunny_Anderson	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Sunny_Anderson	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Sunny_Anderson	1
c7594724-4e46-48bf-b545-dde115e92a96	Sunny_Anderson	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Sunny_Anderson	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Sunny_Anderson	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Sunny_Anderson	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Sunny_Anderson	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Sunny_Anderson	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Sunny_Anderson	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Sunny_Anderson	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Sunny_Anderson	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Sunny_Anderson	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Sunny_Anderson	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Sunny_Anderson	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Sunny_Anderson	1
020f3109-5d91-4cdc-936d-b60387e8f326	Sunny_Anderson	1
96b2311c-d26f-4462-a29c-a94753161467	Sunny_Anderson	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Sunny_Anderson	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Sunny_Anderson	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Sunny_Anderson	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Sunny_Anderson	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Sunny_Anderson	1
532a613b-9be2-43e4-82f4-ddce03d99630	Sunny_Anderson	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Sunny_Anderson	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Sunny_Anderson	-1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Sunny_Anderson	-1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Sunny_Anderson	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Sunny_Anderson	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Sunny_Anderson	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Sunny_Anderson	-1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Sunny_Anderson	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Sunny_Anderson	-1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Sunny_Anderson	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Sunny_Anderson	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Sunny_Anderson	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Sunny_Anderson	-1
9654831d-3c0e-4f29-b411-1111d5b059d2	Sunny_Anderson	-1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Sunny_Anderson	-1
4ac2f167-736f-4f39-be81-2dbe63991d34	Sunny_Anderson	-1
fa22a469-463b-44c5-b0f0-63a24be82fef	Sunny_Anderson	-1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Sunny_Anderson	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Sunny_Anderson	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Sunny_Anderson	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Alycia50	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Alycia50	1
532a613b-9be2-43e4-82f4-ddce03d99630	Alycia50	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Alycia50	1
c7594724-4e46-48bf-b545-dde115e92a96	Alycia50	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Alycia50	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Alycia50	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Alycia50	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Alycia50	1
c02a050c-9299-4313-b24d-d42a6c189505	Alycia50	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Alycia50	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Alycia50	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Alycia50	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Alycia50	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Alycia50	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Alycia50	1
96b2311c-d26f-4462-a29c-a94753161467	Alycia50	1
2508c094-ff79-4881-b756-74234df008f2	Alycia50	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Alycia50	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Alycia50	1
62978666-53c0-4edb-a671-19efd6e9457a	Alycia50	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Alycia50	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Alycia50	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Alycia50	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Alycia50	1
93b57384-8822-4eee-89cc-64c16ed25a59	Alycia50	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Alycia50	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Alycia50	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Alycia50	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Alycia50	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Alycia50	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Alycia50	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Alycia50	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Alycia50	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Alycia50	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Alycia50	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Alycia50	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Alycia50	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Alycia50	1
821f91e3-915a-43dd-89a7-8df33e522565	Alycia50	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Alycia50	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Alycia50	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Alycia50	1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Alycia50	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Alycia50	1
69199805-05c7-4301-8c05-868f29e606d6	Alycia50	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Alycia50	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Alycia50	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Alycia50	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Alycia50	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Alycia50	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Alycia50	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Alycia50	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Alycia50	1
e3d32705-a4e8-4070-8224-442c946b05a8	Alycia50	1
98d76875-65d1-403b-9f65-e1b77fb25903	Alycia50	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Alycia50	1
9f20d789-935c-4109-b05a-3077a29eb1df	Alycia50	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Alycia50	1
8f12c165-b18c-484b-b6e4-8de96add42f0	Alycia50	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Alycia50	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Alycia50	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Alycia50	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Alycia50	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Alycia50	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Alycia50	-1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Alycia50	-1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Alycia50	-1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Alycia50	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Alycia50	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Alycia50	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Alycia50	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Alycia50	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Alycia50	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Alycia50	-1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Alycia50	-1
ad98a18b-91de-4949-aba6-8c04c523dd81	Alycia50	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Alycia50	-1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Alycia50	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Alycia50	-1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Ari_Johnson	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Ari_Johnson	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Ari_Johnson	1
9f20d789-935c-4109-b05a-3077a29eb1df	Ari_Johnson	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Ari_Johnson	1
f3a5a2fd-9586-4eab-b2d5-eac5a4e39027	Ari_Johnson	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Ari_Johnson	1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Ari_Johnson	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Ari_Johnson	1
96b2311c-d26f-4462-a29c-a94753161467	Ari_Johnson	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Ari_Johnson	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Ari_Johnson	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Ari_Johnson	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Ari_Johnson	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Ari_Johnson	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Ari_Johnson	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Ari_Johnson	1
821f91e3-915a-43dd-89a7-8df33e522565	Ari_Johnson	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Ari_Johnson	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Ari_Johnson	1
59457cc7-0ec2-4d23-8b27-bd1a59f3bc2c	Ari_Johnson	1
62978666-53c0-4edb-a671-19efd6e9457a	Ari_Johnson	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Ari_Johnson	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Ari_Johnson	1
36858a27-3c56-46c8-af27-984828aebb98	Ari_Johnson	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Ari_Johnson	1
eeba34a2-1e00-4c93-af95-b70b4670c5a2	Ari_Johnson	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Ari_Johnson	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Ari_Johnson	1
1d5c2502-ca57-4203-9271-bd342aca5648	Ari_Johnson	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Ari_Johnson	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Ari_Johnson	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Ari_Johnson	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Ari_Johnson	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Ari_Johnson	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Ari_Johnson	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Ari_Johnson	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Ari_Johnson	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Ari_Johnson	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Ari_Johnson	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Ari_Johnson	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Ari_Johnson	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Ari_Johnson	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Ari_Johnson	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Ari_Johnson	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Ari_Johnson	1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Ari_Johnson	1
986856b1-ca8e-4b88-8129-0aaf194d4e7d	Ari_Johnson	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Ari_Johnson	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Ari_Johnson	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Ari_Johnson	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Ari_Johnson	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Ari_Johnson	1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Ari_Johnson	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Ari_Johnson	-1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Ari_Johnson	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Ari_Johnson	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Ari_Johnson	-1
e3d32705-a4e8-4070-8224-442c946b05a8	Ari_Johnson	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Ari_Johnson	-1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Ari_Johnson	-1
2508c094-ff79-4881-b756-74234df008f2	Ari_Johnson	-1
6e9d3106-eb15-4d80-9c08-c819a0189623	Ari_Johnson	-1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Ari_Johnson	-1
c7594724-4e46-48bf-b545-dde115e92a96	Ari_Johnson	-1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Ari_Johnson	-1
98d76875-65d1-403b-9f65-e1b77fb25903	Ari_Johnson	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Ari_Johnson	-1
7e73540b-772a-49d9-b5c1-49c000461d56	Ari_Johnson	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Ari_Johnson	-1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Ari_Johnson	-1
99e91398-36df-496e-b4aa-97b6d77cbab1	Ari_Johnson	-1
60d195d0-3674-4b1e-b907-553b0d57d8be	Ari_Johnson	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Miller.Yost54	1
eb9c21ab-a064-4de9-921d-c059814f81c7	Miller.Yost54	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Miller.Yost54	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Miller.Yost54	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Miller.Yost54	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Miller.Yost54	1
93b57384-8822-4eee-89cc-64c16ed25a59	Miller.Yost54	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Miller.Yost54	1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Miller.Yost54	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Miller.Yost54	1
cb2730fa-9028-467f-905d-75c229ed9879	Miller.Yost54	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Miller.Yost54	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Miller.Yost54	1
d8461fd8-8a86-40dd-ab2a-c31cf4812af6	Miller.Yost54	1
bf75a830-7874-44ca-ab46-275c273b4c76	Miller.Yost54	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Miller.Yost54	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Miller.Yost54	1
5a680d3b-55c9-46c1-9b3e-1bacba315b11	Miller.Yost54	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Miller.Yost54	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Miller.Yost54	1
4ac2f167-736f-4f39-be81-2dbe63991d34	Miller.Yost54	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Miller.Yost54	1
2508c094-ff79-4881-b756-74234df008f2	Miller.Yost54	1
23c943e0-2ea7-42c7-9112-c77c08073122	Miller.Yost54	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Miller.Yost54	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Miller.Yost54	1
e6030f49-4156-4c69-8aed-805cb4f8382a	Miller.Yost54	1
821f91e3-915a-43dd-89a7-8df33e522565	Miller.Yost54	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Miller.Yost54	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Miller.Yost54	1
c02a050c-9299-4313-b24d-d42a6c189505	Miller.Yost54	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Miller.Yost54	1
0ebac58c-fa80-4dad-81a7-a0ff8069a5ec	Miller.Yost54	1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Miller.Yost54	1
cca60dc3-f89a-4bb3-ab33-5c55f07caa47	Miller.Yost54	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Miller.Yost54	1
60d195d0-3674-4b1e-b907-553b0d57d8be	Miller.Yost54	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Miller.Yost54	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Miller.Yost54	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Miller.Yost54	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Miller.Yost54	1
ee95e078-4299-4cb4-a596-d4348d73e21a	Miller.Yost54	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Miller.Yost54	1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Miller.Yost54	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Miller.Yost54	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Miller.Yost54	1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Miller.Yost54	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Miller.Yost54	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Miller.Yost54	1
a5f32e66-acb4-44b6-979e-4657a4e3caab	Miller.Yost54	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Miller.Yost54	1
9ecd078c-de1f-40d0-9455-925e4c2c2213	Miller.Yost54	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Miller.Yost54	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Miller.Yost54	1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Miller.Yost54	1
8592ac88-a537-40f3-b024-c5b90b11a69d	Miller.Yost54	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Miller.Yost54	1
9f20d789-935c-4109-b05a-3077a29eb1df	Miller.Yost54	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Miller.Yost54	1
96b2311c-d26f-4462-a29c-a94753161467	Miller.Yost54	1
e3d32705-a4e8-4070-8224-442c946b05a8	Miller.Yost54	-1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Miller.Yost54	-1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Miller.Yost54	-1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Miller.Yost54	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Miller.Yost54	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Miller.Yost54	-1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Miller.Yost54	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Miller.Yost54	-1
532a613b-9be2-43e4-82f4-ddce03d99630	Miller.Yost54	-1
020f3109-5d91-4cdc-936d-b60387e8f326	Miller.Yost54	-1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Miller.Yost54	-1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Miller.Yost54	-1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Miller.Yost54	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Miller.Yost54	-1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Miller.Yost54	-1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Miller.Yost54	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Miller.Yost54	-1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Miller.Yost54	-1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Miller.Yost54	-1
108e57ac-5c11-47db-a106-fc3963f7b58d	Miller.Yost54	-1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Miller.Yost54	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Miller.Yost54	-1
3221ada1-66fb-45ff-992f-bd915d8a8a78	Elissa.Bergstrom	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Elissa.Bergstrom	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Elissa.Bergstrom	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Elissa.Bergstrom	1
23c943e0-2ea7-42c7-9112-c77c08073122	Elissa.Bergstrom	1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Elissa.Bergstrom	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Elissa.Bergstrom	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Elissa.Bergstrom	1
96b2311c-d26f-4462-a29c-a94753161467	Elissa.Bergstrom	1
9914ff27-5e8a-4da4-b3c7-a9b1fbe3a6bd	Elissa.Bergstrom	1
028edee6-e5dd-4c87-83f8-30e3ea11d690	Elissa.Bergstrom	1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Elissa.Bergstrom	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Elissa.Bergstrom	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Elissa.Bergstrom	1
532a613b-9be2-43e4-82f4-ddce03d99630	Elissa.Bergstrom	1
69199805-05c7-4301-8c05-868f29e606d6	Elissa.Bergstrom	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Elissa.Bergstrom	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Elissa.Bergstrom	1
7e73540b-772a-49d9-b5c1-49c000461d56	Elissa.Bergstrom	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Elissa.Bergstrom	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Elissa.Bergstrom	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Elissa.Bergstrom	1
3dcc6c6a-45a3-40b8-bdb5-5a7e858a6485	Elissa.Bergstrom	1
885df98a-8a7a-49d2-aba4-86d08b804cb4	Elissa.Bergstrom	1
020f3109-5d91-4cdc-936d-b60387e8f326	Elissa.Bergstrom	1
c02a050c-9299-4313-b24d-d42a6c189505	Elissa.Bergstrom	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Elissa.Bergstrom	1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Elissa.Bergstrom	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Elissa.Bergstrom	1
c7594724-4e46-48bf-b545-dde115e92a96	Elissa.Bergstrom	1
1d5c2502-ca57-4203-9271-bd342aca5648	Elissa.Bergstrom	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Elissa.Bergstrom	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Elissa.Bergstrom	1
2d4f306b-af00-4179-bc53-d3fd89875ba0	Elissa.Bergstrom	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Elissa.Bergstrom	1
62978666-53c0-4edb-a671-19efd6e9457a	Elissa.Bergstrom	1
f41b43a6-0626-4a85-a49d-1e2a1472f52d	Elissa.Bergstrom	1
fa22a469-463b-44c5-b0f0-63a24be82fef	Elissa.Bergstrom	1
2508c094-ff79-4881-b756-74234df008f2	Elissa.Bergstrom	1
80e81930-37e1-4b4e-9706-cbaf9f163ad6	Elissa.Bergstrom	1
fc65f17f-c071-4362-b9bd-4db4308da997	Elissa.Bergstrom	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Elissa.Bergstrom	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Elissa.Bergstrom	1
38f2126f-a67d-45bf-80c5-fa4a0c140c6b	Elissa.Bergstrom	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Elissa.Bergstrom	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Elissa.Bergstrom	1
6a94e55c-3ccf-498c-b44a-9c5aa3f31c8b	Elissa.Bergstrom	1
c000d026-2e11-4d5d-b4aa-c533bf769016	Elissa.Bergstrom	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Elissa.Bergstrom	1
58bc13cd-aae0-4d84-afa2-21e4f8d472d8	Elissa.Bergstrom	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Elissa.Bergstrom	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Elissa.Bergstrom	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Elissa.Bergstrom	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Elissa.Bergstrom	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Elissa.Bergstrom	1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Elissa.Bergstrom	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Elissa.Bergstrom	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Elissa.Bergstrom	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Elissa.Bergstrom	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Elissa.Bergstrom	1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Elissa.Bergstrom	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Elissa.Bergstrom	-1
bf75a830-7874-44ca-ab46-275c273b4c76	Elissa.Bergstrom	-1
8592ac88-a537-40f3-b024-c5b90b11a69d	Elissa.Bergstrom	-1
fd11ea42-00f3-42bd-8eef-92920baad2aa	Elissa.Bergstrom	-1
bf8865d5-37d7-456a-ace1-e27f1dcbaef2	Elissa.Bergstrom	-1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Elissa.Bergstrom	-1
16a0b69d-3582-47c6-ba91-9c8d9d35202a	Elissa.Bergstrom	-1
8517aab1-684c-4f3c-bf4d-af4df17e511e	Elissa.Bergstrom	-1
a78acc11-6874-4bff-96d4-29ae7974a05c	Elissa.Bergstrom	-1
1291fba4-0ebc-4e8b-b66d-5533c0f9ea2c	Elissa.Bergstrom	-1
8f12c165-b18c-484b-b6e4-8de96add42f0	Elissa.Bergstrom	-1
5d204e1d-c78d-45bc-9c8a-999656dcb32a	Elissa.Bergstrom	-1
821f91e3-915a-43dd-89a7-8df33e522565	Elissa.Bergstrom	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Elissa.Bergstrom	-1
fc65f17f-c071-4362-b9bd-4db4308da997	Daphney_Grimes36	1
d7211d87-9676-41f8-9c99-94fb2bc8b0b3	Daphney_Grimes36	1
4f20be2f-df81-4fa6-8b74-7e32211a22b8	Daphney_Grimes36	1
218ea6a6-87e9-44a4-aa97-c5b2aef4a0be	Daphney_Grimes36	1
1068352b-6b6a-43bd-ac5c-3642fa872bfa	Daphney_Grimes36	1
be5569f2-e2bf-4e8d-82ea-224c2a3fb045	Daphney_Grimes36	1
b711a645-0b1b-4f01-8c65-3508dffd92f3	Daphney_Grimes36	1
ad98a18b-91de-4949-aba6-8c04c523dd81	Daphney_Grimes36	1
0d05f1aa-2f12-46f2-a0fa-86e72255635e	Daphney_Grimes36	1
944aa2a5-fc5c-472a-9477-78c3e64c6f3d	Daphney_Grimes36	1
108e57ac-5c11-47db-a106-fc3963f7b58d	Daphney_Grimes36	1
96b2311c-d26f-4462-a29c-a94753161467	Daphney_Grimes36	1
59bd8b03-2fa1-4f30-9f4d-34ac9c9aada0	Daphney_Grimes36	1
29e9c646-3623-4216-ad73-b7a1256a7d8e	Daphney_Grimes36	1
adc2f6ed-a31e-43e4-9493-6a18866158d1	Daphney_Grimes36	1
d6295f45-ff33-4b75-9be1-c59902d1e9b8	Daphney_Grimes36	1
caab4fb9-698f-4ea6-92cb-dd01fe520c1a	Daphney_Grimes36	1
c8a81b45-cea1-4938-b2bd-5849fea7060d	Daphney_Grimes36	1
6a8bb3f8-0e81-4a61-ad2a-d5f83b60f1fc	Daphney_Grimes36	1
ce8f8441-7cc3-4c8d-b0c1-31773a9f55d9	Daphney_Grimes36	1
62978666-53c0-4edb-a671-19efd6e9457a	Daphney_Grimes36	1
532a613b-9be2-43e4-82f4-ddce03d99630	Daphney_Grimes36	1
71987b86-bbec-457b-a2d9-c1b3257dd876	Daphney_Grimes36	1
998c3dbe-b97d-4d99-9519-efb08dc9c63a	Daphney_Grimes36	1
596b6c27-1c6e-4870-83f6-3cef204cfc5e	Daphney_Grimes36	1
0a5df6a2-52b4-452a-b91e-3ffb6de09944	Daphney_Grimes36	1
99e91398-36df-496e-b4aa-97b6d77cbab1	Daphney_Grimes36	1
f642ee24-7bc0-46e7-9f71-bd9668df40ac	Daphney_Grimes36	1
4be11faa-f041-44ca-8ad8-ab5d74fa85dc	Daphney_Grimes36	1
19d463c1-6cb2-4ee9-ba66-55e7a89b2502	Daphney_Grimes36	1
ad3a12c2-8f46-41b9-b076-6f25cb81903e	Daphney_Grimes36	1
36858a27-3c56-46c8-af27-984828aebb98	Daphney_Grimes36	1
8fbbbcf3-4069-4b73-99f7-d0166a185e8d	Daphney_Grimes36	1
8a2141c2-3f9b-4801-84c5-206e75e8fcdd	Daphney_Grimes36	1
2fd317ca-6aeb-401d-af6c-92bcce6f5943	Daphney_Grimes36	1
5b59f2b2-0dae-4d2a-95dc-c662e5f77cc8	Daphney_Grimes36	1
87c7c99e-25ff-4921-a4a6-7d158ca12169	Daphney_Grimes36	1
98d76875-65d1-403b-9f65-e1b77fb25903	Daphney_Grimes36	1
93b57384-8822-4eee-89cc-64c16ed25a59	Daphney_Grimes36	1
1d5c2502-ca57-4203-9271-bd342aca5648	Daphney_Grimes36	1
6f9add72-b682-4f2a-ad50-dc075b2a6ca9	Daphney_Grimes36	1
b5651e1b-b3b1-4253-9599-a96cc59a3ba6	Daphney_Grimes36	1
a78acc11-6874-4bff-96d4-29ae7974a05c	Daphney_Grimes36	1
c02a050c-9299-4313-b24d-d42a6c189505	Daphney_Grimes36	1
c9d6d7f8-eb89-4f85-8474-0767c578a03d	Daphney_Grimes36	1
3a9aa4c6-812b-4a03-bfb9-2c5d6b12eba0	Daphney_Grimes36	1
bf75a830-7874-44ca-ab46-275c273b4c76	Daphney_Grimes36	1
4889ed0c-8b6e-42b6-8a14-9819098eb223	Daphney_Grimes36	1
e4d73f59-9133-4093-a52a-b8043b7cdfb4	Daphney_Grimes36	1
821f91e3-915a-43dd-89a7-8df33e522565	Daphney_Grimes36	1
857d1eec-bb52-41be-8fe9-dcab56ef9113	Daphney_Grimes36	1
859aea6f-f0b3-4d5c-a417-efcab8d37363	Daphney_Grimes36	1
bd42868f-fb3c-417c-8ad4-38e85ca821dd	Daphney_Grimes36	1
970eed6e-3a47-42a9-b90b-a3c049f96751	Daphney_Grimes36	1
9654831d-3c0e-4f29-b411-1111d5b059d2	Daphney_Grimes36	1
d6432e5e-3724-48bf-b8b0-8f5f959888ea	Daphney_Grimes36	1
0510c62c-31d8-4cf2-8fec-e0a264e16aa8	Daphney_Grimes36	1
8aa35f89-6206-4ed8-adf8-2b6b431c464d	Daphney_Grimes36	1
33661f21-e0a0-44b4-8ee1-5069de617cd6	Daphney_Grimes36	1
b49a1b48-c5eb-481a-a8dd-97188965a26d	Daphney_Grimes36	-1
eb43e6c6-b016-445c-b33c-05468d203319	Daphney_Grimes36	-1
7dc17f06-6ea8-4d89-8b4e-5eda80fbef76	Daphney_Grimes36	-1
11e8b6e2-72d7-4f24-8b64-e195c0117f31	Daphney_Grimes36	-1
ee95e078-4299-4cb4-a596-d4348d73e21a	Daphney_Grimes36	-1
c3846b2e-0815-4774-b023-ed8d8b9b0a0f	Daphney_Grimes36	-1
5ec87a19-20b5-43c5-b9fa-d78b20ab9972	Daphney_Grimes36	-1
58a21a0f-bcbd-4793-9917-e7ed67ee551a	Daphney_Grimes36	-1
782f9c7a-b550-4fd7-9a7f-ebc0c1e9bf5e	Daphney_Grimes36	-1
1c0b1ae0-9b9e-4d54-9538-8131ac880d6a	Daphney_Grimes36	-1
c40dc5ad-3af1-49a5-8778-1553e0132a09	Daphney_Grimes36	-1
3e7dfef9-b496-460c-a24a-9e90bc06c658	Daphney_Grimes36	-1
70b771dc-531b-40ae-b0d0-129c3585a0e6	Daphney_Grimes36	-1
89ce6fc8-8f26-471c-a359-f6c7d61c7a60	Daphney_Grimes36	-1
aa91db1f-fd7e-4869-92b6-2ed892ba1621	Daphney_Grimes36	-1
\.


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posttags posttags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posttags
    ADD CONSTRAINT posttags_pkey PRIMARY KEY (post_id, tag_id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (post_id, username);


--
-- Name: comments comments_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_author_fkey FOREIGN KEY (author) REFERENCES public.users(username) ON DELETE CASCADE;


--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts posts_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_fkey FOREIGN KEY (author) REFERENCES public.users(username) ON DELETE CASCADE;


--
-- Name: posttags posttags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posttags
    ADD CONSTRAINT posttags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posttags posttags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posttags
    ADD CONSTRAINT posttags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: votes votes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: votes votes_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

