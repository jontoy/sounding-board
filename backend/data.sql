--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

SET statement_timeout
= 0;
SET lock_timeout
= 0;
SET idle_in_transaction_session_timeout
= 0;
SET client_encoding
= 'UTF8';
SET standard_conforming_strings
= on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies
= false;
SET xmloption
= content;
SET client_min_messages
= warning;
SET row_security
= off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION
IF NOT EXISTS "uuid-ossp"
WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace
= '';

SET default_table_access_method
= heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users
(
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    avatar_URL TEXT NOT NULL,
    member_since TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    bio TEXT NOT NULL
);

--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts
(
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments
(
    comment_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    post_id uuid NOT NULL,
    text TEXT NOT NULL,
    author TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags
(
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name TEXT NOT NULL
);

--
-- Name: votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.votes
(
    post_id uuid NOT NULL,
    username TEXT NOT NULL,
    value INT NOT NULL
);

--
-- Name: posttags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posttags
(
    post_id uuid NOT NULL,
    tag_id uuid NOT NULL
);

--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
ADD CONSTRAINT users_pkey PRIMARY KEY
(username);

--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
ADD CONSTRAINT posts_pkey PRIMARY KEY
(id);

--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
ADD CONSTRAINT comments_pkey PRIMARY KEY
(comment_id);

--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
ADD CONSTRAINT tags_pkey PRIMARY KEY
(id);

--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
ADD CONSTRAINT votes_pkey PRIMARY KEY
(post_id, username);

--
-- Name: posttags posttags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posttags
ADD CONSTRAINT posttags_pkey PRIMARY KEY
(post_id, tag_id);

--
-- Name: posts posts_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
ADD CONSTRAINT posts_author_fkey FOREIGN KEY
(author) REFERENCES public.users
(username) ON
DELETE CASCADE;

--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY
(post_id) REFERENCES public.posts
(id) ON
DELETE CASCADE;

--
-- Name: comments comments_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--
ALTER TABLE ONLY public.comments
ADD CONSTRAINT comments_author_fkey FOREIGN KEY
(author) REFERENCES public.users
(username) ON
DELETE CASCADE;

--
-- Name: votes votes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
ADD CONSTRAINT votes_post_id_fkey FOREIGN KEY
(post_id) REFERENCES public.posts
(id) ON
DELETE CASCADE;

--
-- Name: votes votes_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--
ALTER TABLE ONLY public.votes
ADD CONSTRAINT votes_username_fkey FOREIGN KEY
(username) REFERENCES public.users
(username) ON
DELETE CASCADE;

--
-- Name: votes posttags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--
ALTER TABLE ONLY public.posttags
ADD CONSTRAINT posttags_post_id_fkey FOREIGN KEY
(post_id) REFERENCES public.posts
(id) ON
DELETE CASCADE;

--
-- Name: votes posttags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--
ALTER TABLE ONLY public.posttags
ADD CONSTRAINT posttags_tag_id_fkey FOREIGN KEY
(tag_id) REFERENCES public.tags
(id) ON
DELETE CASCADE;

--
-- PostgreSQL database dump complete
--

