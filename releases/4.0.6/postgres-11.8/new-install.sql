--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 14.3

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

SET default_tablespace = '';

--
-- Name: accounts_localsiteprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_localsiteprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    profile_id integer NOT NULL,
    local_site_id integer,
    permissions text,
    direct_incoming_request_count integer,
    total_incoming_request_count integer,
    pending_outgoing_request_count integer,
    total_outgoing_request_count integer,
    starred_public_request_count integer
);


ALTER TABLE public.accounts_localsiteprofile OWNER TO postgres;

--
-- Name: accounts_localsiteprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_localsiteprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_localsiteprofile_id_seq OWNER TO postgres;

--
-- Name: accounts_localsiteprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_localsiteprofile_id_seq OWNED BY public.accounts_localsiteprofile.id;


--
-- Name: accounts_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    first_time_setup_done boolean NOT NULL,
    should_send_email boolean NOT NULL,
    should_send_own_updates boolean NOT NULL,
    collapsed_diffs boolean NOT NULL,
    wordwrapped_diffs boolean NOT NULL,
    syntax_highlighting boolean NOT NULL,
    is_private boolean NOT NULL,
    open_an_issue boolean NOT NULL,
    default_use_rich_text boolean,
    show_closed boolean NOT NULL,
    sort_review_request_columns character varying(256) NOT NULL,
    sort_dashboard_columns character varying(256) NOT NULL,
    sort_submitter_columns character varying(256) NOT NULL,
    sort_group_columns character varying(256) NOT NULL,
    review_request_columns character varying(256) NOT NULL,
    dashboard_columns character varying(256) NOT NULL,
    submitter_columns character varying(256) NOT NULL,
    group_columns character varying(256) NOT NULL,
    timezone character varying(30) NOT NULL,
    settings text,
    extra_data text
);


ALTER TABLE public.accounts_profile OWNER TO postgres;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_profile_id_seq OWNER TO postgres;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_profile_id_seq OWNED BY public.accounts_profile.id;


--
-- Name: accounts_profile_starred_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_profile_starred_groups (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_profile_starred_groups OWNER TO postgres;

--
-- Name: accounts_profile_starred_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_profile_starred_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_profile_starred_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_profile_starred_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_profile_starred_groups_id_seq OWNED BY public.accounts_profile_starred_groups.id;


--
-- Name: accounts_profile_starred_review_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_profile_starred_review_requests (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    reviewrequest_id integer NOT NULL
);


ALTER TABLE public.accounts_profile_starred_review_requests OWNER TO postgres;

--
-- Name: accounts_profile_starred_review_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_profile_starred_review_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_profile_starred_review_requests_id_seq OWNER TO postgres;

--
-- Name: accounts_profile_starred_review_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_profile_starred_review_requests_id_seq OWNED BY public.accounts_profile_starred_review_requests.id;


--
-- Name: accounts_reviewrequestvisit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_reviewrequestvisit (
    id integer NOT NULL,
    user_id integer NOT NULL,
    review_request_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    visibility character varying(1) NOT NULL
);


ALTER TABLE public.accounts_reviewrequestvisit OWNER TO postgres;

--
-- Name: accounts_reviewrequestvisit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_reviewrequestvisit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_reviewrequestvisit_id_seq OWNER TO postgres;

--
-- Name: accounts_reviewrequestvisit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_reviewrequestvisit_id_seq OWNED BY public.accounts_reviewrequestvisit.id;


--
-- Name: accounts_trophy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_trophy (
    id integer NOT NULL,
    category character varying(100) NOT NULL,
    received_date timestamp with time zone NOT NULL,
    review_request_id integer NOT NULL,
    local_site_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_trophy OWNER TO postgres;

--
-- Name: accounts_trophy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_trophy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_trophy_id_seq OWNER TO postgres;

--
-- Name: accounts_trophy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_trophy_id_seq OWNED BY public.accounts_trophy.id;


--
-- Name: attachments_fileattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments_fileattachment (
    id integer NOT NULL,
    caption character varying(256) NOT NULL,
    draft_caption character varying(256) NOT NULL,
    orig_filename character varying(256),
    user_id integer,
    local_site_id integer,
    uuid character varying(255) NOT NULL,
    file character varying(512),
    mimetype character varying(256) NOT NULL,
    repo_path character varying(1024),
    repo_revision character varying(64),
    repository_id integer,
    added_in_filediff_id integer,
    attachment_history_id integer,
    attachment_revision integer NOT NULL
);


ALTER TABLE public.attachments_fileattachment OWNER TO postgres;

--
-- Name: attachments_fileattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_fileattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_fileattachment_id_seq OWNER TO postgres;

--
-- Name: attachments_fileattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_fileattachment_id_seq OWNED BY public.attachments_fileattachment.id;


--
-- Name: attachments_fileattachmenthistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments_fileattachmenthistory (
    id integer NOT NULL,
    display_position integer NOT NULL,
    latest_revision integer
);


ALTER TABLE public.attachments_fileattachmenthistory OWNER TO postgres;

--
-- Name: attachments_fileattachmenthistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_fileattachmenthistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_fileattachmenthistory_id_seq OWNER TO postgres;

--
-- Name: attachments_fileattachmenthistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_fileattachmenthistory_id_seq OWNED BY public.attachments_fileattachmenthistory.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: changedescs_changedescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changedescs_changedescription (
    id integer NOT NULL,
    user_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    fields_changed text NOT NULL
);


ALTER TABLE public.changedescs_changedescription OWNER TO postgres;

--
-- Name: changedescs_changedescription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.changedescs_changedescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changedescs_changedescription_id_seq OWNER TO postgres;

--
-- Name: changedescs_changedescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.changedescs_changedescription_id_seq OWNED BY public.changedescs_changedescription.id;


--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE public.corsheaders_corsmodel OWNER TO postgres;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.corsheaders_corsmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corsheaders_corsmodel_id_seq OWNER TO postgres;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.corsheaders_corsmodel_id_seq OWNED BY public.corsheaders_corsmodel.id;


--
-- Name: diffviewer_diffcommit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_diffcommit (
    id integer NOT NULL,
    filename character varying(256) NOT NULL,
    diffset_id integer NOT NULL,
    author_name character varying(256) NOT NULL,
    author_email character varying(256) NOT NULL,
    author_date_utc timestamp with time zone NOT NULL,
    author_date_offset integer NOT NULL,
    committer_name character varying(256),
    committer_email character varying(256),
    committer_date_utc timestamp with time zone,
    committer_date_offset integer,
    commit_message text NOT NULL,
    commit_id character varying(64) NOT NULL,
    parent_id character varying(64) NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    extra_data text
);


ALTER TABLE public.diffviewer_diffcommit OWNER TO postgres;

--
-- Name: diffviewer_diffcommit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_diffcommit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_diffcommit_id_seq OWNER TO postgres;

--
-- Name: diffviewer_diffcommit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_diffcommit_id_seq OWNED BY public.diffviewer_diffcommit.id;


--
-- Name: diffviewer_diffset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_diffset (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    revision integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    basedir character varying(256) NOT NULL,
    history_id integer,
    repository_id integer NOT NULL,
    diffcompat integer NOT NULL,
    base_commit_id character varying(64),
    commit_count integer,
    extra_data text
);


ALTER TABLE public.diffviewer_diffset OWNER TO postgres;

--
-- Name: diffviewer_diffset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_diffset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_diffset_id_seq OWNER TO postgres;

--
-- Name: diffviewer_diffset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_diffset_id_seq OWNED BY public.diffviewer_diffset.id;


--
-- Name: diffviewer_diffsethistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_diffsethistory (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    last_diff_updated timestamp with time zone,
    extra_data text
);


ALTER TABLE public.diffviewer_diffsethistory OWNER TO postgres;

--
-- Name: diffviewer_diffsethistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_diffsethistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_diffsethistory_id_seq OWNER TO postgres;

--
-- Name: diffviewer_diffsethistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_diffsethistory_id_seq OWNED BY public.diffviewer_diffsethistory.id;


--
-- Name: diffviewer_filediff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_filediff (
    id integer NOT NULL,
    diffset_id integer NOT NULL,
    commit_id integer,
    source_file character varying(1024) NOT NULL,
    dest_file character varying(1024) NOT NULL,
    source_revision character varying(512) NOT NULL,
    dest_detail character varying(512) NOT NULL,
    "binary" boolean NOT NULL,
    status character varying(1) NOT NULL,
    diff_base64 text NOT NULL,
    diff_hash_id character varying(40),
    raw_diff_hash_id integer,
    parent_diff_base64 text NOT NULL,
    parent_diff_hash_id character varying(40),
    raw_parent_diff_hash_id integer,
    extra_data text
);


ALTER TABLE public.diffviewer_filediff OWNER TO postgres;

--
-- Name: diffviewer_filediff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_filediff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_filediff_id_seq OWNER TO postgres;

--
-- Name: diffviewer_filediff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_filediff_id_seq OWNED BY public.diffviewer_filediff.id;


--
-- Name: diffviewer_filediffdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_filediffdata (
    binary_hash character varying(40) NOT NULL,
    "binary" text NOT NULL,
    extra_data text
);


ALTER TABLE public.diffviewer_filediffdata OWNER TO postgres;

--
-- Name: diffviewer_rawfilediffdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diffviewer_rawfilediffdata (
    id integer NOT NULL,
    binary_hash character varying(40) NOT NULL,
    "binary" bytea NOT NULL,
    compression character varying(1),
    extra_data text
);


ALTER TABLE public.diffviewer_rawfilediffdata OWNER TO postgres;

--
-- Name: diffviewer_rawfilediffdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diffviewer_rawfilediffdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diffviewer_rawfilediffdata_id_seq OWNER TO postgres;

--
-- Name: diffviewer_rawfilediffdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diffviewer_rawfilediffdata_id_seq OWNED BY public.diffviewer_rawfilediffdata.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_evolution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_evolution (
    id integer NOT NULL,
    version_id integer NOT NULL,
    app_label character varying(200) NOT NULL,
    label character varying(100) NOT NULL
);


ALTER TABLE public.django_evolution OWNER TO postgres;

--
-- Name: django_evolution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_evolution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_evolution_id_seq OWNER TO postgres;

--
-- Name: django_evolution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_evolution_id_seq OWNED BY public.django_evolution.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_project_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_project_version (
    id integer NOT NULL,
    signature text NOT NULL,
    "when" timestamp with time zone NOT NULL
);


ALTER TABLE public.django_project_version OWNER TO postgres;

--
-- Name: django_project_version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_project_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_project_version_id_seq OWNER TO postgres;

--
-- Name: django_project_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_project_version_id_seq OWNED BY public.django_project_version.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: djblets_privacy_storedconsentdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djblets_privacy_storedconsentdata (
    id integer NOT NULL,
    user_id integer,
    audit_identifier character varying(255),
    time_added timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    consent_grants text NOT NULL,
    audit_trail text NOT NULL
);


ALTER TABLE public.djblets_privacy_storedconsentdata OWNER TO postgres;

--
-- Name: djblets_privacy_storedconsentdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djblets_privacy_storedconsentdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djblets_privacy_storedconsentdata_id_seq OWNER TO postgres;

--
-- Name: djblets_privacy_storedconsentdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djblets_privacy_storedconsentdata_id_seq OWNED BY public.djblets_privacy_storedconsentdata.id;


--
-- Name: extensions_registeredextension; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extensions_registeredextension (
    id integer NOT NULL,
    class_name character varying(128) NOT NULL,
    name character varying(32) NOT NULL,
    enabled boolean NOT NULL,
    installed boolean NOT NULL,
    settings text NOT NULL
);


ALTER TABLE public.extensions_registeredextension OWNER TO postgres;

--
-- Name: extensions_registeredextension_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extensions_registeredextension_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extensions_registeredextension_id_seq OWNER TO postgres;

--
-- Name: extensions_registeredextension_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extensions_registeredextension_id_seq OWNED BY public.extensions_registeredextension.id;


--
-- Name: hostingsvcs_hostingserviceaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hostingsvcs_hostingserviceaccount (
    id integer NOT NULL,
    service_name character varying(128) NOT NULL,
    hosting_url character varying(255),
    username character varying(128) NOT NULL,
    data text NOT NULL,
    visible boolean NOT NULL,
    local_site_id integer
);


ALTER TABLE public.hostingsvcs_hostingserviceaccount OWNER TO postgres;

--
-- Name: hostingsvcs_hostingserviceaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hostingsvcs_hostingserviceaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hostingsvcs_hostingserviceaccount_id_seq OWNER TO postgres;

--
-- Name: hostingsvcs_hostingserviceaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hostingsvcs_hostingserviceaccount_id_seq OWNED BY public.hostingsvcs_hostingserviceaccount.id;


--
-- Name: integrations_integrationconfig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.integrations_integrationconfig (
    id integer NOT NULL,
    integration_id character varying(255) NOT NULL,
    time_added timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(255),
    enabled boolean NOT NULL,
    settings text NOT NULL,
    extra_data text NOT NULL,
    local_site_id integer
);


ALTER TABLE public.integrations_integrationconfig OWNER TO postgres;

--
-- Name: integrations_integrationconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.integrations_integrationconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.integrations_integrationconfig_id_seq OWNER TO postgres;

--
-- Name: integrations_integrationconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.integrations_integrationconfig_id_seq OWNED BY public.integrations_integrationconfig.id;


--
-- Name: notifications_webhooktarget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications_webhooktarget (
    id integer NOT NULL,
    enabled boolean NOT NULL,
    events character varying(105) NOT NULL,
    url character varying(200) NOT NULL,
    encoding character varying(40) NOT NULL,
    use_custom_content boolean NOT NULL,
    custom_content text,
    secret character varying(128) NOT NULL,
    apply_to character varying(1) NOT NULL,
    local_site_id integer,
    extra_data text
);


ALTER TABLE public.notifications_webhooktarget OWNER TO postgres;

--
-- Name: notifications_webhooktarget_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_webhooktarget_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_webhooktarget_id_seq OWNER TO postgres;

--
-- Name: notifications_webhooktarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_webhooktarget_id_seq OWNED BY public.notifications_webhooktarget.id;


--
-- Name: notifications_webhooktarget_repositories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications_webhooktarget_repositories (
    id integer NOT NULL,
    webhooktarget_id integer NOT NULL,
    repository_id integer NOT NULL
);


ALTER TABLE public.notifications_webhooktarget_repositories OWNER TO postgres;

--
-- Name: notifications_webhooktarget_repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_webhooktarget_repositories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_webhooktarget_repositories_id_seq OWNER TO postgres;

--
-- Name: notifications_webhooktarget_repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_webhooktarget_repositories_id_seq OWNED BY public.notifications_webhooktarget_repositories.id;


--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNED BY public.oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_application (
    id integer NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    skip_authorization boolean NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNED BY public.oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_grant (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNED BY public.oauth2_provider_grant.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id integer NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNED BY public.oauth2_provider_refreshtoken.id;


--
-- Name: reviewboard_oauth_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviewboard_oauth_application (
    id integer NOT NULL,
    client_id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    skip_authorization boolean NOT NULL,
    enabled boolean NOT NULL,
    original_user_id integer,
    local_site_id integer,
    extra_data text
);


ALTER TABLE public.reviewboard_oauth_application OWNER TO postgres;

--
-- Name: reviewboard_oauth_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviewboard_oauth_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviewboard_oauth_application_id_seq OWNER TO postgres;

--
-- Name: reviewboard_oauth_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviewboard_oauth_application_id_seq OWNED BY public.reviewboard_oauth_application.id;


--
-- Name: reviews_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_comment (
    id integer NOT NULL,
    issue_opened boolean NOT NULL,
    issue_status character varying(1),
    reply_to_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    extra_data text,
    filediff_id integer NOT NULL,
    interfilediff_id integer,
    first_line integer,
    num_lines integer,
    CONSTRAINT reviews_comment_first_line_check CHECK ((first_line >= 0)),
    CONSTRAINT reviews_comment_num_lines_check CHECK ((num_lines >= 0))
);


ALTER TABLE public.reviews_comment OWNER TO postgres;

--
-- Name: reviews_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_comment_id_seq OWNER TO postgres;

--
-- Name: reviews_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_comment_id_seq OWNED BY public.reviews_comment.id;


--
-- Name: reviews_defaultreviewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_defaultreviewer (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    file_regex character varying(256) NOT NULL,
    local_site_id integer
);


ALTER TABLE public.reviews_defaultreviewer OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_defaultreviewer_groups (
    id integer NOT NULL,
    defaultreviewer_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.reviews_defaultreviewer_groups OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_defaultreviewer_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_defaultreviewer_groups_id_seq OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_defaultreviewer_groups_id_seq OWNED BY public.reviews_defaultreviewer_groups.id;


--
-- Name: reviews_defaultreviewer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_defaultreviewer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_defaultreviewer_id_seq OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_defaultreviewer_id_seq OWNED BY public.reviews_defaultreviewer.id;


--
-- Name: reviews_defaultreviewer_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_defaultreviewer_people (
    id integer NOT NULL,
    defaultreviewer_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_defaultreviewer_people OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_defaultreviewer_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_defaultreviewer_people_id_seq OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_defaultreviewer_people_id_seq OWNED BY public.reviews_defaultreviewer_people.id;


--
-- Name: reviews_defaultreviewer_repository; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_defaultreviewer_repository (
    id integer NOT NULL,
    defaultreviewer_id integer NOT NULL,
    repository_id integer NOT NULL
);


ALTER TABLE public.reviews_defaultreviewer_repository OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_defaultreviewer_repository_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_defaultreviewer_repository_id_seq OWNER TO postgres;

--
-- Name: reviews_defaultreviewer_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_defaultreviewer_repository_id_seq OWNED BY public.reviews_defaultreviewer_repository.id;


--
-- Name: reviews_fileattachmentcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_fileattachmentcomment (
    id integer NOT NULL,
    issue_opened boolean NOT NULL,
    issue_status character varying(1),
    reply_to_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    extra_data text,
    file_attachment_id integer NOT NULL,
    diff_against_file_attachment_id integer
);


ALTER TABLE public.reviews_fileattachmentcomment OWNER TO postgres;

--
-- Name: reviews_fileattachmentcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_fileattachmentcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_fileattachmentcomment_id_seq OWNER TO postgres;

--
-- Name: reviews_fileattachmentcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_fileattachmentcomment_id_seq OWNED BY public.reviews_fileattachmentcomment.id;


--
-- Name: reviews_generalcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_generalcomment (
    id integer NOT NULL,
    issue_opened boolean NOT NULL,
    issue_status character varying(1),
    reply_to_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    extra_data text
);


ALTER TABLE public.reviews_generalcomment OWNER TO postgres;

--
-- Name: reviews_generalcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_generalcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_generalcomment_id_seq OWNER TO postgres;

--
-- Name: reviews_generalcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_generalcomment_id_seq OWNED BY public.reviews_generalcomment.id;


--
-- Name: reviews_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_group (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    display_name character varying(64) NOT NULL,
    mailing_list character varying(254) NOT NULL,
    email_list_only boolean NOT NULL,
    local_site_id integer,
    is_default_group boolean NOT NULL,
    incoming_request_count integer,
    invite_only boolean NOT NULL,
    visible boolean NOT NULL,
    extra_data text
);


ALTER TABLE public.reviews_group OWNER TO postgres;

--
-- Name: reviews_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_group_id_seq OWNER TO postgres;

--
-- Name: reviews_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_group_id_seq OWNED BY public.reviews_group.id;


--
-- Name: reviews_group_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_group_users (
    id integer NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_group_users OWNER TO postgres;

--
-- Name: reviews_group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_group_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_group_users_id_seq OWNER TO postgres;

--
-- Name: reviews_group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_group_users_id_seq OWNED BY public.reviews_group_users.id;


--
-- Name: reviews_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review (
    id integer NOT NULL,
    review_request_id integer NOT NULL,
    user_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    ship_it boolean NOT NULL,
    base_reply_to_id integer,
    email_message_id character varying(255),
    time_emailed timestamp with time zone,
    body_top text NOT NULL,
    body_top_rich_text boolean NOT NULL,
    body_bottom text NOT NULL,
    body_bottom_rich_text boolean NOT NULL,
    body_top_reply_to_id integer,
    body_bottom_reply_to_id integer,
    extra_data text,
    rich_text boolean NOT NULL,
    reviewed_diffset_id integer
);


ALTER TABLE public.reviews_review OWNER TO postgres;

--
-- Name: reviews_review_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review_comments (
    id integer NOT NULL,
    review_id integer NOT NULL,
    comment_id integer NOT NULL
);


ALTER TABLE public.reviews_review_comments OWNER TO postgres;

--
-- Name: reviews_review_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_review_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_comments_id_seq OWNED BY public.reviews_review_comments.id;


--
-- Name: reviews_review_file_attachment_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review_file_attachment_comments (
    id integer NOT NULL,
    review_id integer NOT NULL,
    fileattachmentcomment_id integer NOT NULL
);


ALTER TABLE public.reviews_review_file_attachment_comments OWNER TO postgres;

--
-- Name: reviews_review_file_attachment_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_file_attachment_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_file_attachment_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_review_file_attachment_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_file_attachment_comments_id_seq OWNED BY public.reviews_review_file_attachment_comments.id;


--
-- Name: reviews_review_general_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review_general_comments (
    id integer NOT NULL,
    review_id integer NOT NULL,
    generalcomment_id integer NOT NULL
);


ALTER TABLE public.reviews_review_general_comments OWNER TO postgres;

--
-- Name: reviews_review_general_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_general_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_general_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_review_general_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_general_comments_id_seq OWNED BY public.reviews_review_general_comments.id;


--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_id_seq OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews_review.id;


--
-- Name: reviews_review_screenshot_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review_screenshot_comments (
    id integer NOT NULL,
    review_id integer NOT NULL,
    screenshotcomment_id integer NOT NULL
);


ALTER TABLE public.reviews_review_screenshot_comments OWNER TO postgres;

--
-- Name: reviews_review_screenshot_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_screenshot_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_screenshot_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_review_screenshot_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_screenshot_comments_id_seq OWNED BY public.reviews_review_screenshot_comments.id;


--
-- Name: reviews_reviewrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest (
    id integer NOT NULL,
    description text NOT NULL,
    description_rich_text boolean NOT NULL,
    testing_done text NOT NULL,
    testing_done_rich_text boolean NOT NULL,
    bugs_closed character varying(300) NOT NULL,
    branch character varying(300) NOT NULL,
    commit_id character varying(64),
    extra_data text,
    rich_text boolean NOT NULL,
    summary character varying(300) NOT NULL,
    submitter_id integer NOT NULL,
    time_added timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    status character varying(1) NOT NULL,
    public boolean NOT NULL,
    changenum integer,
    repository_id integer,
    email_message_id character varying(255),
    time_emailed timestamp with time zone,
    diffset_history_id integer NOT NULL,
    last_review_timestamp timestamp with time zone,
    shipit_count integer,
    issue_open_count integer,
    issue_resolved_count integer,
    issue_dropped_count integer,
    issue_verifying_count integer,
    screenshots_count integer,
    inactive_screenshots_count integer,
    file_attachments_count integer,
    inactive_file_attachments_count integer,
    local_site_id integer,
    local_id integer,
    CONSTRAINT reviews_reviewrequest_changenum_check CHECK ((changenum >= 0))
);


ALTER TABLE public.reviews_reviewrequest OWNER TO postgres;

--
-- Name: reviews_reviewrequest_changedescs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_changedescs (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    changedescription_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_changedescs OWNER TO postgres;

--
-- Name: reviews_reviewrequest_changedescs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_changedescs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_changedescs_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_changedescs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_changedescs_id_seq OWNED BY public.reviews_reviewrequest_changedescs.id;


--
-- Name: reviews_reviewrequest_depends_on; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_depends_on (
    id integer NOT NULL,
    from_reviewrequest_id integer NOT NULL,
    to_reviewrequest_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_depends_on OWNER TO postgres;

--
-- Name: reviews_reviewrequest_depends_on_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_depends_on_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_depends_on_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_depends_on_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_depends_on_id_seq OWNED BY public.reviews_reviewrequest_depends_on.id;


--
-- Name: reviews_reviewrequest_file_attachment_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_file_attachment_histories (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    fileattachmenthistory_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_file_attachment_histories OWNER TO postgres;

--
-- Name: reviews_reviewrequest_file_attachment_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_file_attachment_histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_file_attachment_histories_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_file_attachment_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_file_attachment_histories_id_seq OWNED BY public.reviews_reviewrequest_file_attachment_histories.id;


--
-- Name: reviews_reviewrequest_file_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_file_attachments (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    fileattachment_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_file_attachments OWNER TO postgres;

--
-- Name: reviews_reviewrequest_file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_file_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_file_attachments_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_file_attachments_id_seq OWNED BY public.reviews_reviewrequest_file_attachments.id;


--
-- Name: reviews_reviewrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_id_seq OWNED BY public.reviews_reviewrequest.id;


--
-- Name: reviews_reviewrequest_inactive_file_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_inactive_file_attachments (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    fileattachment_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_inactive_file_attachments OWNER TO postgres;

--
-- Name: reviews_reviewrequest_inactive_file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_inactive_file_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_inactive_file_attachments_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_inactive_file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_inactive_file_attachments_id_seq OWNED BY public.reviews_reviewrequest_inactive_file_attachments.id;


--
-- Name: reviews_reviewrequest_inactive_screenshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_inactive_screenshots (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    screenshot_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_inactive_screenshots OWNER TO postgres;

--
-- Name: reviews_reviewrequest_inactive_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_inactive_screenshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_inactive_screenshots_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_inactive_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_inactive_screenshots_id_seq OWNED BY public.reviews_reviewrequest_inactive_screenshots.id;


--
-- Name: reviews_reviewrequest_screenshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_screenshots (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    screenshot_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_screenshots OWNER TO postgres;

--
-- Name: reviews_reviewrequest_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_screenshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_screenshots_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_screenshots_id_seq OWNED BY public.reviews_reviewrequest_screenshots.id;


--
-- Name: reviews_reviewrequest_target_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_target_groups (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_target_groups OWNER TO postgres;

--
-- Name: reviews_reviewrequest_target_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_target_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_target_groups_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_target_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_target_groups_id_seq OWNED BY public.reviews_reviewrequest_target_groups.id;


--
-- Name: reviews_reviewrequest_target_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequest_target_people (
    id integer NOT NULL,
    reviewrequest_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequest_target_people OWNER TO postgres;

--
-- Name: reviews_reviewrequest_target_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequest_target_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequest_target_people_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequest_target_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequest_target_people_id_seq OWNED BY public.reviews_reviewrequest_target_people.id;


--
-- Name: reviews_reviewrequestdraft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft (
    id integer NOT NULL,
    description text NOT NULL,
    description_rich_text boolean NOT NULL,
    testing_done text NOT NULL,
    testing_done_rich_text boolean NOT NULL,
    bugs_closed character varying(300) NOT NULL,
    branch character varying(300) NOT NULL,
    commit_id character varying(64),
    extra_data text,
    rich_text boolean NOT NULL,
    summary character varying(300) NOT NULL,
    owner_id integer,
    review_request_id integer NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    diffset_id integer,
    changedesc_id integer,
    screenshots_count integer,
    inactive_screenshots_count integer,
    file_attachments_count integer,
    inactive_file_attachments_count integer
);


ALTER TABLE public.reviews_reviewrequestdraft OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_depends_on; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_depends_on (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    reviewrequest_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_depends_on OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_depends_on_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_depends_on_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_depends_on_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_depends_on_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_depends_on_id_seq OWNED BY public.reviews_reviewrequestdraft_depends_on.id;


--
-- Name: reviews_reviewrequestdraft_file_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_file_attachments (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    fileattachment_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_file_attachments OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_file_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_file_attachments_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_file_attachments_id_seq OWNED BY public.reviews_reviewrequestdraft_file_attachments.id;


--
-- Name: reviews_reviewrequestdraft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_id_seq OWNED BY public.reviews_reviewrequestdraft.id;


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_inactive_file_attachments (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    fileattachment_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_inactive_file_attachments OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq OWNED BY public.reviews_reviewrequestdraft_inactive_file_attachments.id;


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_inactive_screenshots (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    screenshot_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_inactive_screenshots OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_inactive_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_inactive_screenshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_inactive_screenshots_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_inactive_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_inactive_screenshots_id_seq OWNED BY public.reviews_reviewrequestdraft_inactive_screenshots.id;


--
-- Name: reviews_reviewrequestdraft_screenshots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_screenshots (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    screenshot_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_screenshots OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_screenshots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_screenshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_screenshots_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_screenshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_screenshots_id_seq OWNED BY public.reviews_reviewrequestdraft_screenshots.id;


--
-- Name: reviews_reviewrequestdraft_target_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_target_groups (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_target_groups OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_target_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_target_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_target_groups_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_target_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_target_groups_id_seq OWNED BY public.reviews_reviewrequestdraft_target_groups.id;


--
-- Name: reviews_reviewrequestdraft_target_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_reviewrequestdraft_target_people (
    id integer NOT NULL,
    reviewrequestdraft_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_reviewrequestdraft_target_people OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_target_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewrequestdraft_target_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewrequestdraft_target_people_id_seq OWNER TO postgres;

--
-- Name: reviews_reviewrequestdraft_target_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewrequestdraft_target_people_id_seq OWNED BY public.reviews_reviewrequestdraft_target_people.id;


--
-- Name: reviews_screenshot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_screenshot (
    id integer NOT NULL,
    caption character varying(256) NOT NULL,
    draft_caption character varying(256) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.reviews_screenshot OWNER TO postgres;

--
-- Name: reviews_screenshot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_screenshot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_screenshot_id_seq OWNER TO postgres;

--
-- Name: reviews_screenshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_screenshot_id_seq OWNED BY public.reviews_screenshot.id;


--
-- Name: reviews_screenshotcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_screenshotcomment (
    id integer NOT NULL,
    issue_opened boolean NOT NULL,
    issue_status character varying(1),
    reply_to_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    rich_text boolean NOT NULL,
    extra_data text,
    screenshot_id integer NOT NULL,
    x smallint,
    y smallint NOT NULL,
    w smallint NOT NULL,
    h smallint NOT NULL,
    CONSTRAINT reviews_screenshotcomment_h_check CHECK ((h >= 0)),
    CONSTRAINT reviews_screenshotcomment_w_check CHECK ((w >= 0)),
    CONSTRAINT reviews_screenshotcomment_x_check CHECK ((x >= 0)),
    CONSTRAINT reviews_screenshotcomment_y_check CHECK ((y >= 0))
);


ALTER TABLE public.reviews_screenshotcomment OWNER TO postgres;

--
-- Name: reviews_screenshotcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_screenshotcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_screenshotcomment_id_seq OWNER TO postgres;

--
-- Name: reviews_screenshotcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_screenshotcomment_id_seq OWNED BY public.reviews_screenshotcomment.id;


--
-- Name: reviews_statusupdate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_statusupdate (
    id integer NOT NULL,
    service_id character varying(255) NOT NULL,
    user_id integer,
    "timestamp" timestamp with time zone NOT NULL,
    summary character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    url_text character varying(64) NOT NULL,
    state character varying(1) NOT NULL,
    review_request_id integer NOT NULL,
    change_description_id integer,
    review_id integer,
    extra_data text,
    timeout integer
);


ALTER TABLE public.reviews_statusupdate OWNER TO postgres;

--
-- Name: reviews_statusupdate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_statusupdate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_statusupdate_id_seq OWNER TO postgres;

--
-- Name: reviews_statusupdate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_statusupdate_id_seq OWNED BY public.reviews_statusupdate.id;


--
-- Name: scmtools_repository; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scmtools_repository (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    mirror_path character varying(255) NOT NULL,
    raw_file_url character varying(255) NOT NULL,
    username character varying(32) NOT NULL,
    password character varying(128) NOT NULL,
    extra_data text,
    tool_id integer NOT NULL,
    hosting_account_id integer,
    bug_tracker character varying(256) NOT NULL,
    encoding character varying(32) NOT NULL,
    visible boolean NOT NULL,
    archived boolean NOT NULL,
    archived_timestamp timestamp with time zone,
    local_site_id integer,
    public boolean NOT NULL,
    hooks_uuid character varying(32)
);


ALTER TABLE public.scmtools_repository OWNER TO postgres;

--
-- Name: scmtools_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scmtools_repository_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scmtools_repository_id_seq OWNER TO postgres;

--
-- Name: scmtools_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scmtools_repository_id_seq OWNED BY public.scmtools_repository.id;


--
-- Name: scmtools_repository_review_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scmtools_repository_review_groups (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.scmtools_repository_review_groups OWNER TO postgres;

--
-- Name: scmtools_repository_review_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scmtools_repository_review_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scmtools_repository_review_groups_id_seq OWNER TO postgres;

--
-- Name: scmtools_repository_review_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scmtools_repository_review_groups_id_seq OWNED BY public.scmtools_repository_review_groups.id;


--
-- Name: scmtools_repository_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scmtools_repository_users (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.scmtools_repository_users OWNER TO postgres;

--
-- Name: scmtools_repository_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scmtools_repository_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scmtools_repository_users_id_seq OWNER TO postgres;

--
-- Name: scmtools_repository_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scmtools_repository_users_id_seq OWNED BY public.scmtools_repository_users.id;


--
-- Name: scmtools_tool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scmtools_tool (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    class_name character varying(128) NOT NULL
);


ALTER TABLE public.scmtools_tool OWNER TO postgres;

--
-- Name: scmtools_tool_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scmtools_tool_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scmtools_tool_id_seq OWNER TO postgres;

--
-- Name: scmtools_tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scmtools_tool_id_seq OWNED BY public.scmtools_tool.id;


--
-- Name: site_localsite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_localsite (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    public boolean NOT NULL,
    extra_data text
);


ALTER TABLE public.site_localsite OWNER TO postgres;

--
-- Name: site_localsite_admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_localsite_admins (
    id integer NOT NULL,
    localsite_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.site_localsite_admins OWNER TO postgres;

--
-- Name: site_localsite_admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_localsite_admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_localsite_admins_id_seq OWNER TO postgres;

--
-- Name: site_localsite_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_localsite_admins_id_seq OWNED BY public.site_localsite_admins.id;


--
-- Name: site_localsite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_localsite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_localsite_id_seq OWNER TO postgres;

--
-- Name: site_localsite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_localsite_id_seq OWNED BY public.site_localsite.id;


--
-- Name: site_localsite_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_localsite_users (
    id integer NOT NULL,
    localsite_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.site_localsite_users OWNER TO postgres;

--
-- Name: site_localsite_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_localsite_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_localsite_users_id_seq OWNER TO postgres;

--
-- Name: site_localsite_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_localsite_users_id_seq OWNED BY public.site_localsite_users.id;


--
-- Name: siteconfig_siteconfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siteconfig_siteconfiguration (
    id integer NOT NULL,
    site_id integer NOT NULL,
    version character varying(20) NOT NULL,
    settings text NOT NULL
);


ALTER TABLE public.siteconfig_siteconfiguration OWNER TO postgres;

--
-- Name: siteconfig_siteconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.siteconfig_siteconfiguration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.siteconfig_siteconfiguration_id_seq OWNER TO postgres;

--
-- Name: siteconfig_siteconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siteconfig_siteconfiguration_id_seq OWNED BY public.siteconfig_siteconfiguration.id;


--
-- Name: webapi_webapitoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webapi_webapitoken (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(40) NOT NULL,
    time_added timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    note text NOT NULL,
    policy text,
    extra_data text,
    local_site_id integer
);


ALTER TABLE public.webapi_webapitoken OWNER TO postgres;

--
-- Name: webapi_webapitoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webapi_webapitoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webapi_webapitoken_id_seq OWNER TO postgres;

--
-- Name: webapi_webapitoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webapi_webapitoken_id_seq OWNED BY public.webapi_webapitoken.id;


--
-- Name: accounts_localsiteprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_localsiteprofile_id_seq'::regclass);


--
-- Name: accounts_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_id_seq'::regclass);


--
-- Name: accounts_profile_starred_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_starred_groups_id_seq'::regclass);


--
-- Name: accounts_profile_starred_review_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_starred_review_requests_id_seq'::regclass);


--
-- Name: accounts_reviewrequestvisit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit ALTER COLUMN id SET DEFAULT nextval('public.accounts_reviewrequestvisit_id_seq'::regclass);


--
-- Name: accounts_trophy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy ALTER COLUMN id SET DEFAULT nextval('public.accounts_trophy_id_seq'::regclass);


--
-- Name: attachments_fileattachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment ALTER COLUMN id SET DEFAULT nextval('public.attachments_fileattachment_id_seq'::regclass);


--
-- Name: attachments_fileattachmenthistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachmenthistory ALTER COLUMN id SET DEFAULT nextval('public.attachments_fileattachmenthistory_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: changedescs_changedescription id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changedescs_changedescription ALTER COLUMN id SET DEFAULT nextval('public.changedescs_changedescription_id_seq'::regclass);


--
-- Name: corsheaders_corsmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('public.corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: diffviewer_diffcommit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffcommit ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_diffcommit_id_seq'::regclass);


--
-- Name: diffviewer_diffset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffset ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_diffset_id_seq'::regclass);


--
-- Name: diffviewer_diffsethistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffsethistory ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_diffsethistory_id_seq'::regclass);


--
-- Name: diffviewer_filediff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_filediff_id_seq'::regclass);


--
-- Name: diffviewer_rawfilediffdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_rawfilediffdata ALTER COLUMN id SET DEFAULT nextval('public.diffviewer_rawfilediffdata_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_evolution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_evolution ALTER COLUMN id SET DEFAULT nextval('public.django_evolution_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_project_version id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_project_version ALTER COLUMN id SET DEFAULT nextval('public.django_project_version_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: djblets_privacy_storedconsentdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djblets_privacy_storedconsentdata ALTER COLUMN id SET DEFAULT nextval('public.djblets_privacy_storedconsentdata_id_seq'::regclass);


--
-- Name: extensions_registeredextension id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extensions_registeredextension ALTER COLUMN id SET DEFAULT nextval('public.extensions_registeredextension_id_seq'::regclass);


--
-- Name: hostingsvcs_hostingserviceaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostingsvcs_hostingserviceaccount ALTER COLUMN id SET DEFAULT nextval('public.hostingsvcs_hostingserviceaccount_id_seq'::regclass);


--
-- Name: integrations_integrationconfig id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_integrationconfig ALTER COLUMN id SET DEFAULT nextval('public.integrations_integrationconfig_id_seq'::regclass);


--
-- Name: notifications_webhooktarget id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget ALTER COLUMN id SET DEFAULT nextval('public.notifications_webhooktarget_id_seq'::regclass);


--
-- Name: notifications_webhooktarget_repositories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories ALTER COLUMN id SET DEFAULT nextval('public.notifications_webhooktarget_repositories_id_seq'::regclass);


--
-- Name: oauth2_provider_accesstoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: oauth2_provider_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass);


--
-- Name: oauth2_provider_grant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass);


--
-- Name: oauth2_provider_refreshtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: reviewboard_oauth_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application ALTER COLUMN id SET DEFAULT nextval('public.reviewboard_oauth_application_id_seq'::regclass);


--
-- Name: reviews_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment ALTER COLUMN id SET DEFAULT nextval('public.reviews_comment_id_seq'::regclass);


--
-- Name: reviews_defaultreviewer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer ALTER COLUMN id SET DEFAULT nextval('public.reviews_defaultreviewer_id_seq'::regclass);


--
-- Name: reviews_defaultreviewer_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups ALTER COLUMN id SET DEFAULT nextval('public.reviews_defaultreviewer_groups_id_seq'::regclass);


--
-- Name: reviews_defaultreviewer_people id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people ALTER COLUMN id SET DEFAULT nextval('public.reviews_defaultreviewer_people_id_seq'::regclass);


--
-- Name: reviews_defaultreviewer_repository id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository ALTER COLUMN id SET DEFAULT nextval('public.reviews_defaultreviewer_repository_id_seq'::regclass);


--
-- Name: reviews_fileattachmentcomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment ALTER COLUMN id SET DEFAULT nextval('public.reviews_fileattachmentcomment_id_seq'::regclass);


--
-- Name: reviews_generalcomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_generalcomment ALTER COLUMN id SET DEFAULT nextval('public.reviews_generalcomment_id_seq'::regclass);


--
-- Name: reviews_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group ALTER COLUMN id SET DEFAULT nextval('public.reviews_group_id_seq'::regclass);


--
-- Name: reviews_group_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users ALTER COLUMN id SET DEFAULT nextval('public.reviews_group_users_id_seq'::regclass);


--
-- Name: reviews_review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Name: reviews_review_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_comments_id_seq'::regclass);


--
-- Name: reviews_review_file_attachment_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_file_attachment_comments_id_seq'::regclass);


--
-- Name: reviews_review_general_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_general_comments_id_seq'::regclass);


--
-- Name: reviews_review_screenshot_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments ALTER COLUMN id SET DEFAULT nextval('public.reviews_review_screenshot_comments_id_seq'::regclass);


--
-- Name: reviews_reviewrequest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_changedescs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_changedescs_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_depends_on id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_depends_on_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_file_attachment_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_file_attachment_histories_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_file_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_file_attachments_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_inactive_file_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_inactive_file_attachments_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_inactive_screenshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_inactive_screenshots_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_screenshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_screenshots_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_target_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_target_groups_id_seq'::regclass);


--
-- Name: reviews_reviewrequest_target_people id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequest_target_people_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_depends_on id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_depends_on_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_file_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_file_attachments_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_inactive_screenshots_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_screenshots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_screenshots_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_target_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_target_groups_id_seq'::regclass);


--
-- Name: reviews_reviewrequestdraft_target_people id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people ALTER COLUMN id SET DEFAULT nextval('public.reviews_reviewrequestdraft_target_people_id_seq'::regclass);


--
-- Name: reviews_screenshot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshot ALTER COLUMN id SET DEFAULT nextval('public.reviews_screenshot_id_seq'::regclass);


--
-- Name: reviews_screenshotcomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshotcomment ALTER COLUMN id SET DEFAULT nextval('public.reviews_screenshotcomment_id_seq'::regclass);


--
-- Name: reviews_statusupdate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate ALTER COLUMN id SET DEFAULT nextval('public.reviews_statusupdate_id_seq'::regclass);


--
-- Name: scmtools_repository id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository ALTER COLUMN id SET DEFAULT nextval('public.scmtools_repository_id_seq'::regclass);


--
-- Name: scmtools_repository_review_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups ALTER COLUMN id SET DEFAULT nextval('public.scmtools_repository_review_groups_id_seq'::regclass);


--
-- Name: scmtools_repository_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users ALTER COLUMN id SET DEFAULT nextval('public.scmtools_repository_users_id_seq'::regclass);


--
-- Name: scmtools_tool id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_tool ALTER COLUMN id SET DEFAULT nextval('public.scmtools_tool_id_seq'::regclass);


--
-- Name: site_localsite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite ALTER COLUMN id SET DEFAULT nextval('public.site_localsite_id_seq'::regclass);


--
-- Name: site_localsite_admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins ALTER COLUMN id SET DEFAULT nextval('public.site_localsite_admins_id_seq'::regclass);


--
-- Name: site_localsite_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users ALTER COLUMN id SET DEFAULT nextval('public.site_localsite_users_id_seq'::regclass);


--
-- Name: siteconfig_siteconfiguration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siteconfig_siteconfiguration ALTER COLUMN id SET DEFAULT nextval('public.siteconfig_siteconfiguration_id_seq'::regclass);


--
-- Name: webapi_webapitoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken ALTER COLUMN id SET DEFAULT nextval('public.webapi_webapitoken_id_seq'::regclass);


--
-- Data for Name: accounts_localsiteprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_localsiteprofile (id, user_id, profile_id, local_site_id, permissions, direct_incoming_request_count, total_incoming_request_count, pending_outgoing_request_count, total_outgoing_request_count, starred_public_request_count) FROM stdin;
\.


--
-- Data for Name: accounts_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_profile (id, user_id, first_time_setup_done, should_send_email, should_send_own_updates, collapsed_diffs, wordwrapped_diffs, syntax_highlighting, is_private, open_an_issue, default_use_rich_text, show_closed, sort_review_request_columns, sort_dashboard_columns, sort_submitter_columns, sort_group_columns, review_request_columns, dashboard_columns, submitter_columns, group_columns, timezone, settings, extra_data) FROM stdin;
\.


--
-- Data for Name: accounts_profile_starred_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_profile_starred_groups (id, profile_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_profile_starred_review_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_profile_starred_review_requests (id, profile_id, reviewrequest_id) FROM stdin;
\.


--
-- Data for Name: accounts_reviewrequestvisit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_reviewrequestvisit (id, user_id, review_request_id, "timestamp", visibility) FROM stdin;
\.


--
-- Data for Name: accounts_trophy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_trophy (id, category, received_date, review_request_id, local_site_id, user_id) FROM stdin;
\.


--
-- Data for Name: attachments_fileattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments_fileattachment (id, caption, draft_caption, orig_filename, user_id, local_site_id, uuid, file, mimetype, repo_path, repo_revision, repository_id, added_in_filediff_id, attachment_history_id, attachment_revision) FROM stdin;
\.


--
-- Data for Name: attachments_fileattachmenthistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments_fileattachmenthistory (id, display_position, latest_revision) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add cors model	1	add_corsmodel
2	Can change cors model	1	change_corsmodel
3	Can delete cors model	1	delete_corsmodel
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add session	8	add_session
23	Can change session	8	change_session
24	Can delete session	8	delete_session
25	Can add registered extension	9	add_registeredextension
26	Can change registered extension	9	change_registeredextension
27	Can delete registered extension	9	delete_registeredextension
28	Can add Stored consent data	10	add_storedconsentdata
29	Can change Stored consent data	10	change_storedconsentdata
30	Can delete Stored consent data	10	delete_storedconsentdata
31	Can add site configuration	11	add_siteconfiguration
32	Can change site configuration	11	change_siteconfiguration
33	Can delete site configuration	11	delete_siteconfiguration
34	Can add grant	12	add_grant
35	Can change grant	12	change_grant
36	Can delete grant	12	delete_grant
37	Can add application	13	add_application
38	Can change application	13	change_application
39	Can delete application	13	delete_application
40	Can add access token	14	add_accesstoken
41	Can change access token	14	change_accesstoken
42	Can delete access token	14	delete_accesstoken
43	Can add refresh token	15	add_refreshtoken
44	Can change refresh token	15	change_refreshtoken
45	Can delete refresh token	15	delete_refreshtoken
46	Can add Review Request Visit	16	add_reviewrequestvisit
47	Can change Review Request Visit	16	change_reviewrequestvisit
48	Can delete Review Request Visit	16	delete_reviewrequestvisit
49	Can add Profile	17	add_profile
50	Can change Profile	17	change_profile
51	Can delete Profile	17	delete_profile
52	Can add Local Site Profile	18	add_localsiteprofile
53	Can change Local Site Profile	18	change_localsiteprofile
54	Can delete Local Site Profile	18	delete_localsiteprofile
55	Can add Trophy	19	add_trophy
56	Can change Trophy	19	change_trophy
57	Can delete Trophy	19	delete_trophy
58	Can add File Attachment History	20	add_fileattachmenthistory
59	Can change File Attachment History	20	change_fileattachmenthistory
60	Can delete File Attachment History	20	delete_fileattachmenthistory
61	Can add File Attachment	21	add_fileattachment
62	Can change File Attachment	21	change_fileattachment
63	Can delete File Attachment	21	delete_fileattachment
64	Can add Change Description	22	add_changedescription
65	Can change Change Description	22	change_changedescription
66	Can delete Change Description	22	delete_changedescription
67	Can add Diff Set	23	add_diffset
68	Can change Diff Set	23	change_diffset
69	Can delete Diff Set	23	delete_diffset
70	Can add Diff Commit	24	add_diffcommit
71	Can change Diff Commit	24	change_diffcommit
72	Can delete Diff Commit	24	delete_diffcommit
73	Can add Diff Set History	25	add_diffsethistory
74	Can change Diff Set History	25	change_diffsethistory
75	Can delete Diff Set History	25	delete_diffsethistory
76	Can add Legacy File Diff Data	26	add_legacyfilediffdata
77	Can change Legacy File Diff Data	26	change_legacyfilediffdata
78	Can delete Legacy File Diff Data	26	delete_legacyfilediffdata
79	Can add Raw File Diff Data	27	add_rawfilediffdata
80	Can change Raw File Diff Data	27	change_rawfilediffdata
81	Can delete Raw File Diff Data	27	delete_rawfilediffdata
82	Can add File Diff	28	add_filediff
83	Can change File Diff	28	change_filediff
84	Can delete File Diff	28	delete_filediff
85	Can add Hosting Service Account	29	add_hostingserviceaccount
86	Can change Hosting Service Account	29	change_hostingserviceaccount
87	Can delete Hosting Service Account	29	delete_hostingserviceaccount
88	Can add Integration Configuration	30	add_integrationconfig
89	Can change Integration Configuration	30	change_integrationconfig
90	Can delete Integration Configuration	30	delete_integrationconfig
91	Can add Webhook	31	add_webhooktarget
92	Can change Webhook	31	change_webhooktarget
93	Can delete Webhook	31	delete_webhooktarget
94	Can add OAuth Application	32	add_application
95	Can change OAuth Application	32	change_application
96	Can delete OAuth Application	32	delete_application
97	Can add Review Group	33	add_group
98	Can change Review Group	33	change_group
99	Can delete Review Group	33	delete_group
100	Can view invite-only Groups	33	can_view_invite_only_groups
101	Can add Default Reviewer	34	add_defaultreviewer
102	Can change Default Reviewer	34	change_defaultreviewer
103	Can delete Default Reviewer	34	delete_defaultreviewer
104	Can add Diff Comment	35	add_comment
105	Can change Diff Comment	35	change_comment
106	Can delete Diff Comment	35	delete_comment
107	Can add File Attachment Comment	36	add_fileattachmentcomment
108	Can change File Attachment Comment	36	change_fileattachmentcomment
109	Can delete File Attachment Comment	36	delete_fileattachmentcomment
110	Can add General Comment	37	add_generalcomment
111	Can change General Comment	37	change_generalcomment
112	Can delete General Comment	37	delete_generalcomment
113	Can add Screenshot	38	add_screenshot
114	Can change Screenshot	38	change_screenshot
115	Can delete Screenshot	38	delete_screenshot
116	Can add Review Request	39	add_reviewrequest
117	Can change Review Request	39	change_reviewrequest
118	Can delete Review Request	39	delete_reviewrequest
119	Can change status	39	can_change_status
120	Can submit as another user	39	can_submit_as_another_user
121	Can edit review request	39	can_edit_reviewrequest
122	Can add Screenshot Comment	40	add_screenshotcomment
123	Can change Screenshot Comment	40	change_screenshotcomment
124	Can delete Screenshot Comment	40	delete_screenshotcomment
125	Can add Review	41	add_review
126	Can change Review	41	change_review
127	Can delete Review	41	delete_review
128	Can add Review Request Draft	42	add_reviewrequestdraft
129	Can change Review Request Draft	42	change_reviewrequestdraft
130	Can delete Review Request Draft	42	delete_reviewrequestdraft
131	Can add Status Update	43	add_statusupdate
132	Can change Status Update	43	change_statusupdate
133	Can delete Status Update	43	delete_statusupdate
134	Can add Tool	44	add_tool
135	Can change Tool	44	change_tool
136	Can delete Tool	44	delete_tool
137	Can add Repository	45	add_repository
138	Can change Repository	45	change_repository
139	Can delete Repository	45	delete_repository
140	Can add Local Site	46	add_localsite
141	Can change Local Site	46	change_localsite
142	Can delete Local Site	46	delete_localsite
143	Can add Web API Token	47	add_webapitoken
144	Can change Web API Token	47	change_webapitoken
145	Can delete Web API Token	47	delete_webapitoken
146	Can add version	48	add_version
147	Can change version	48	change_version
148	Can delete version	48	delete_version
149	Can add evolution	49	add_evolution
150	Can change evolution	49	change_evolution
151	Can delete evolution	49	delete_evolution
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: changedescs_changedescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changedescs_changedescription (id, user_id, "timestamp", public, text, rich_text, fields_changed) FROM stdin;
\.


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Data for Name: diffviewer_diffcommit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_diffcommit (id, filename, diffset_id, author_name, author_email, author_date_utc, author_date_offset, committer_name, committer_email, committer_date_utc, committer_date_offset, commit_message, commit_id, parent_id, last_modified, extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_diffset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_diffset (id, name, revision, "timestamp", basedir, history_id, repository_id, diffcompat, base_commit_id, commit_count, extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_diffsethistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_diffsethistory (id, name, "timestamp", last_diff_updated, extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_filediff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_filediff (id, diffset_id, commit_id, source_file, dest_file, source_revision, dest_detail, "binary", status, diff_base64, diff_hash_id, raw_diff_hash_id, parent_diff_base64, parent_diff_hash_id, raw_parent_diff_hash_id, extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_filediffdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_filediffdata (binary_hash, "binary", extra_data) FROM stdin;
\.


--
-- Data for Name: diffviewer_rawfilediffdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diffviewer_rawfilediffdata (id, binary_hash, "binary", compression, extra_data) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	corsheaders	corsmodel
2	admin	logentry
3	auth	group
4	auth	permission
5	auth	user
6	contenttypes	contenttype
7	sites	site
8	sessions	session
9	djblets_extensions	registeredextension
10	djblets_privacy	storedconsentdata
11	djblets_siteconfig	siteconfiguration
12	oauth2_provider	grant
13	oauth2_provider	application
14	oauth2_provider	accesstoken
15	oauth2_provider	refreshtoken
16	accounts	reviewrequestvisit
17	accounts	profile
18	accounts	localsiteprofile
19	accounts	trophy
20	attachments	fileattachmenthistory
21	attachments	fileattachment
22	changedescs	changedescription
23	diffviewer	diffset
24	diffviewer	diffcommit
25	diffviewer	diffsethistory
26	diffviewer	legacyfilediffdata
27	diffviewer	rawfilediffdata
28	diffviewer	filediff
29	hostingsvcs	hostingserviceaccount
30	integrations	integrationconfig
31	notifications	webhooktarget
32	oauth	application
33	reviews	group
34	reviews	defaultreviewer
35	reviews	comment
36	reviews	fileattachmentcomment
37	reviews	generalcomment
38	reviews	screenshot
39	reviews	reviewrequest
40	reviews	screenshotcomment
41	reviews	review
42	reviews	reviewrequestdraft
43	reviews	statusupdate
44	scmtools	tool
45	scmtools	repository
46	site	localsite
47	webapi	webapitoken
48	django_evolution	version
49	django_evolution	evolution
\.


--
-- Data for Name: django_evolution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_evolution (id, version_id, app_label, label) FROM stdin;
1	1	admin	admin_move_to_migrations
2	1	auth	auth_delete_message
3	1	auth	auth_unique_together_baseline
4	1	auth	auth_move_to_migrations
5	1	contenttypes	contenttypes_unique_together_baseline
6	1	contenttypes	contenttypes_move_to_migrations
7	1	sites	sites_move_to_migrations
8	1	sessions	session_expire_date_db_index
9	1	sessions	sessions_move_to_migrations
10	1	djblets_extensions	update_app_label
11	1	djblets_privacy	audit_indentifier
12	1	djblets_privacy	update_app_label
13	1	djblets_siteconfig	update_app_label
14	1	oauth2_provider	move_to_migrations
15	1	accounts	is_private
16	1	accounts	timezone
17	1	accounts	open_an_issue
18	1	accounts	extra_data
19	1	accounts	timezone_length_30
20	1	accounts	localsiteprofile_permissions
21	1	accounts	unique_together_baseline
22	1	accounts	profile_show_closed
23	1	accounts	profile_should_send_email
24	1	accounts	profile_should_send_own_updates
25	1	accounts	profile_default_use_rich_text
26	1	accounts	reviewrequestvisit_visibility
27	1	accounts	profile_settings
28	1	attachments	file_attachment_orig_filename
29	1	attachments	file_attachment_file_max_length_512
30	1	attachments	file_attachment_repo_info
31	1	attachments	file_attachment_repo_path_no_index
32	1	attachments	file_attachment_repo_revision_max_length_64
33	1	attachments	file_attachment_revision
34	1	attachments	file_attachment_ownership
35	1	attachments	file_attachment_uuid
36	1	changedescs	rich_text
37	1	changedescs	changedesc_user
38	1	diffviewer	add_parent_diffs
39	1	diffviewer	filediff_filenames_1024_chars
40	1	diffviewer	diffset_basedir
41	1	diffviewer	filediff_status
42	1	diffviewer	add_diff_hash
43	1	diffviewer	diffsethistory_diff_updated
44	1	diffviewer	filediffdata_line_counts
45	1	diffviewer	diffset_base_commit_id
46	1	diffviewer	filediffdata_extra_data
47	1	diffviewer	all_extra_data
48	1	diffviewer	raw_diff_file_data
49	1	diffviewer	diffcommit_relations
50	1	diffviewer	delete_file_count_fields
51	1	hostingsvcs	account_hosting_url
52	1	hostingsvcs	account_hosting_url_max_length_255
53	1	hostingsvcs	account_unique_together_baseline
54	1	notifications	webhooktarget_extra_state
55	1	notifications	webhooktarget_extra_data_null
56	1	notifications	manytomanyfield_rm_null
57	1	oauth	disabled_for_security
58	1	reviews	change_descriptions
59	1	reviews	last_review_timestamp
60	1	reviews	shipit_count
61	1	reviews	default_reviewer_repositories
62	1	reviews	null_repository
63	1	reviews	localsite
64	1	reviews	group_incoming_request_count
65	1	reviews	group_invite_only
66	1	reviews	group_visible
67	1	reviews	default_reviewer_local_site
68	1	reviews	add_issues_to_comments
69	1	reviews	file_attachments
70	1	reviews	file_attachment_comment_extra_data
71	1	reviews	review_request_last_review_activity_timestamp
72	1	reviews	review_request_depends_on
73	1	reviews	commit_id
74	1	reviews	file_attachment_comment_diff_id
75	1	reviews	rich_text
76	1	reviews	base_comment_extra_data
77	1	reviews	unique_together_baseline
78	1	reviews	extra_data
79	1	reviews	review_request_issue_counts
80	1	reviews	group_mailing_list_charfield
81	1	reviews	review_request_draft_commit_id
82	1	reviews	group_email_list_only
83	1	reviews	review_request_file_attachment_histories
84	1	reviews	review_request_summary_index
85	1	reviews	review_request_summary_index_manual
86	1	reviews	split_rich_text
87	1	reviews	is_default_group
88	1	reviews	general_comments
89	1	reviews	add_owner_to_draft
90	1	reviews	status_update_timeout
91	1	reviews	comment_issue_verification
92	1	reviews	review_request_screenshot_attachment_counters
93	1	reviews	manytomanyfield_rm_null
94	1	scmtools	bugzilla_url_charfield
95	1	scmtools	repository_raw_file_url
96	1	scmtools	repository_visible
97	1	scmtools	repository_path_length_255
98	1	scmtools	localsite
99	1	scmtools	repository_access_control
100	1	scmtools	group_site
101	1	scmtools	repository_hosting_accounts
102	1	scmtools	repository_extra_data_null
103	1	scmtools	unique_together_baseline
104	1	scmtools	repository_archive
105	1	scmtools	repository_hooks_uuid
106	1	scmtools	repository_raw_password
107	1	scmtools	repository_name_length_255
108	1	site	localsite_public
109	1	site	localsite_extra_data
110	1	webapi	webapitoken_jsonfield_null
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	admin	0001_initial	2022-05-16 00:53:19.162536+00
2	auth	0001_initial	2022-05-16 00:53:19.162568+00
3	contenttypes	0001_initial	2022-05-16 00:53:19.162573+00
4	oauth2_provider	0001_initial	2022-05-16 00:53:19.162578+00
5	sessions	0001_initial	2022-05-16 00:53:19.162583+00
6	sites	0001_initial	2022-05-16 00:53:19.162588+00
7	contenttypes	0001_initial	2022-05-16 00:53:19.32035+00
8	auth	0001_initial	2022-05-16 00:53:19.73751+00
9	admin	0001_initial	2022-05-16 00:53:19.839592+00
10	sites	0001_initial	2022-05-16 00:53:19.881133+00
11	sessions	0001_initial	2022-05-16 00:53:19.965358+00
12	oauth2_provider	0001_initial	2022-05-16 00:53:20.557274+00
13	oauth2_provider	0002_08_updates	2022-05-16 00:53:20.622573+00
14	admin	0002_logentry_remove_auto_add	2022-05-16 00:53:23.796489+00
15	contenttypes	0002_remove_content_type_name	2022-05-16 00:53:23.861487+00
16	auth	0002_alter_permission_name_max_length	2022-05-16 00:53:23.887055+00
17	auth	0003_alter_user_email_max_length	2022-05-16 00:53:23.908403+00
18	auth	0004_alter_user_username_opts	2022-05-16 00:53:23.923009+00
19	auth	0005_alter_user_last_login_null	2022-05-16 00:53:23.943+00
20	auth	0006_require_contenttypes_0002	2022-05-16 00:53:23.947555+00
21	auth	0007_alter_validators_add_error_messages	2022-05-16 00:53:23.961827+00
22	auth	0008_alter_user_username_max_length	2022-05-16 00:53:23.9982+00
23	sites	0002_alter_domain_unique	2022-05-16 00:53:24.041736+00
\.


--
-- Data for Name: django_project_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_project_version (id, signature, "when") FROM stdin;
1	json!{"__version__": 2, "apps": {"django_evolution": {"legacy_app_label": "django_evolution", "upgrade_method": "evolutions", "models": {"Version": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "signature": {"type": "django_evolution.models.SignatureField"}, "when": {"type": "django.db.models.DateTimeField"}}, "meta": {"pk_column": "id", "db_table": "django_project_version", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "Evolution": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "version": {"type": "django.db.models.ForeignKey", "related_model": "django_evolution.Version"}, "app_label": {"type": "django.db.models.CharField", "attrs": {"max_length": 200}}, "label": {"type": "django.db.models.CharField", "attrs": {"max_length": 100}}}, "meta": {"pk_column": "id", "db_table": "django_evolution", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "corsheaders": {"legacy_app_label": "corsheaders", "models": {"CorsModel": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "cors": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}}, "meta": {"pk_column": "id", "db_table": "corsheaders_corsmodel", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "admin": {"legacy_app_label": "admin", "upgrade_method": "migrations", "applied_migrations": ["0001_initial", "0002_logentry_remove_auto_add"], "models": {"LogEntry": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "action_time": {"type": "django.db.models.DateTimeField"}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "content_type": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "contenttypes.ContentType"}, "object_id": {"type": "django.db.models.TextField", "attrs": {"null": true}}, "object_repr": {"type": "django.db.models.CharField", "attrs": {"max_length": 200}}, "action_flag": {"type": "django.db.models.PositiveSmallIntegerField"}, "change_message": {"type": "django.db.models.TextField"}}, "meta": {"pk_column": "id", "db_table": "django_admin_log", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "auth": {"legacy_app_label": "auth", "upgrade_method": "migrations", "applied_migrations": ["0001_initial", "0002_alter_permission_name_max_length", "0003_alter_user_email_max_length", "0004_alter_user_username_opts", "0005_alter_user_last_login_null", "0006_require_contenttypes_0002", "0007_alter_validators_add_error_messages", "0008_alter_user_username_max_length"], "models": {"Permission": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "content_type": {"type": "django.db.models.ForeignKey", "related_model": "contenttypes.ContentType"}, "codename": {"type": "django.db.models.CharField", "attrs": {"max_length": 100}}}, "meta": {"pk_column": "id", "db_table": "auth_permission", "indexes": [], "db_tablespace": "", "unique_together": [["content_type", "codename"]], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "Group": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 80, "unique": true}}, "permissions": {"type": "django.db.models.ManyToManyField", "related_model": "auth.Permission"}}, "meta": {"pk_column": "id", "db_table": "auth_group", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "User": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "password": {"type": "django.db.models.CharField", "attrs": {"max_length": 128}}, "last_login": {"type": "django.db.models.DateTimeField", "attrs": {"null": true}}, "is_superuser": {"type": "django.db.models.BooleanField"}, "username": {"type": "django.db.models.CharField", "attrs": {"max_length": 150, "unique": true}}, "first_name": {"type": "django.db.models.CharField", "attrs": {"max_length": 30}}, "last_name": {"type": "django.db.models.CharField", "attrs": {"max_length": 30}}, "email": {"type": "django.db.models.EmailField", "attrs": {"max_length": 254}}, "is_staff": {"type": "django.db.models.BooleanField"}, "is_active": {"type": "django.db.models.BooleanField"}, "date_joined": {"type": "django.db.models.DateTimeField"}, "groups": {"type": "django.db.models.ManyToManyField", "related_model": "auth.Group"}, "user_permissions": {"type": "django.db.models.ManyToManyField", "related_model": "auth.Permission"}}, "meta": {"pk_column": "id", "db_table": "auth_user", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "contenttypes": {"legacy_app_label": "contenttypes", "upgrade_method": "migrations", "applied_migrations": ["0001_initial", "0002_remove_content_type_name"], "models": {"ContentType": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "app_label": {"type": "django.db.models.CharField", "attrs": {"max_length": 100}}, "model": {"type": "django.db.models.CharField", "attrs": {"max_length": 100}}}, "meta": {"pk_column": "id", "db_table": "django_content_type", "indexes": [], "db_tablespace": "", "unique_together": [["app_label", "model"]], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "sites": {"legacy_app_label": "sites", "upgrade_method": "migrations", "applied_migrations": ["0001_initial", "0002_alter_domain_unique"], "models": {"Site": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "domain": {"type": "django.db.models.CharField", "attrs": {"max_length": 100, "unique": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 50}}}, "meta": {"pk_column": "id", "db_table": "django_site", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "sessions": {"legacy_app_label": "sessions", "upgrade_method": "migrations", "applied_migrations": ["0001_initial"], "models": {"Session": {"fields": {"session_key": {"type": "django.db.models.CharField", "attrs": {"max_length": 40, "primary_key": true}}, "session_data": {"type": "django.db.models.TextField"}, "expire_date": {"type": "django.db.models.DateTimeField", "attrs": {"db_index": true}}}, "meta": {"pk_column": "session_key", "db_table": "django_session", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "oauth2_provider": {"legacy_app_label": "oauth2_provider", "upgrade_method": "migrations", "applied_migrations": ["0001_initial", "0002_08_updates"], "models": {"Application": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "client_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 100, "unique": true, "db_index": true}}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "redirect_uris": {"type": "django.db.models.TextField"}, "client_type": {"type": "django.db.models.CharField", "attrs": {"max_length": 32}}, "authorization_grant_type": {"type": "django.db.models.CharField", "attrs": {"max_length": 32}}, "client_secret": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "db_index": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "skip_authorization": {"type": "django.db.models.BooleanField"}}, "meta": {"pk_column": "id", "db_table": "oauth2_provider_application", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "Grant": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "code": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "db_index": true}}, "application": {"type": "django.db.models.ForeignKey", "related_model": "oauth.Application"}, "expires": {"type": "django.db.models.DateTimeField"}, "redirect_uri": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "scope": {"type": "django.db.models.TextField"}}, "meta": {"pk_column": "id", "db_table": "oauth2_provider_grant", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "AccessToken": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "user": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "auth.User"}, "token": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "db_index": true}}, "application": {"type": "django.db.models.ForeignKey", "related_model": "oauth.Application"}, "expires": {"type": "django.db.models.DateTimeField"}, "scope": {"type": "django.db.models.TextField"}}, "meta": {"pk_column": "id", "db_table": "oauth2_provider_accesstoken", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "RefreshToken": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "token": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "db_index": true}}, "application": {"type": "django.db.models.ForeignKey", "related_model": "oauth.Application"}, "access_token": {"type": "django.db.models.OneToOneField", "attrs": {"unique": true}, "related_model": "oauth2_provider.AccessToken"}}, "meta": {"pk_column": "id", "db_table": "oauth2_provider_refreshtoken", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "accounts": {"legacy_app_label": "accounts", "upgrade_method": "evolutions", "models": {"ReviewRequestVisit": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "review_request": {"type": "django.db.models.ForeignKey", "related_model": "reviews.ReviewRequest"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "visibility": {"type": "django.db.models.CharField", "attrs": {"max_length": 1}}}, "meta": {"pk_column": "id", "db_table": "accounts_reviewrequestvisit", "indexes": [], "db_tablespace": "", "unique_together": [["user", "review_request"]], "__unique_together_applied": true, "index_together": [["user", "visibility"]], "constraints": []}}, "Profile": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "user": {"type": "django.db.models.ForeignKey", "attrs": {"unique": true}, "related_model": "auth.User"}, "first_time_setup_done": {"type": "django.db.models.BooleanField"}, "should_send_email": {"type": "django.db.models.BooleanField"}, "should_send_own_updates": {"type": "django.db.models.BooleanField"}, "collapsed_diffs": {"type": "django.db.models.BooleanField"}, "wordwrapped_diffs": {"type": "django.db.models.BooleanField"}, "syntax_highlighting": {"type": "django.db.models.BooleanField"}, "is_private": {"type": "django.db.models.BooleanField"}, "open_an_issue": {"type": "django.db.models.BooleanField"}, "default_use_rich_text": {"type": "django.db.models.NullBooleanField", "attrs": {"null": true}}, "show_closed": {"type": "django.db.models.BooleanField"}, "sort_review_request_columns": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "sort_dashboard_columns": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "sort_submitter_columns": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "sort_group_columns": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "review_request_columns": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "dashboard_columns": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "submitter_columns": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "group_columns": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "timezone": {"type": "django.db.models.CharField", "attrs": {"max_length": 30}}, "settings": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "starred_review_requests": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.ReviewRequest"}, "starred_groups": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Group"}}, "meta": {"pk_column": "id", "db_table": "accounts_profile", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "LocalSiteProfile": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "profile": {"type": "django.db.models.ForeignKey", "related_model": "accounts.Profile"}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "permissions": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "direct_incoming_request_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "total_incoming_request_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "pending_outgoing_request_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "total_outgoing_request_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "starred_public_request_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "accounts_localsiteprofile", "indexes": [], "db_tablespace": "", "unique_together": [["user", "local_site"], ["profile", "local_site"]], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "Trophy": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "category": {"type": "django.db.models.CharField", "attrs": {"max_length": 100}}, "received_date": {"type": "django.db.models.DateTimeField"}, "review_request": {"type": "django.db.models.ForeignKey", "related_model": "reviews.ReviewRequest"}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}}, "meta": {"pk_column": "id", "db_table": "accounts_trophy", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "attachments": {"legacy_app_label": "attachments", "upgrade_method": "evolutions", "models": {"FileAttachmentHistory": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "display_position": {"type": "django.db.models.IntegerField"}, "latest_revision": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "attachments_fileattachmenthistory", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "FileAttachment": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "caption": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "draft_caption": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "orig_filename": {"type": "django.db.models.CharField", "attrs": {"max_length": 256, "null": true}}, "user": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "auth.User"}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "uuid": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "file": {"type": "django.db.models.FileField", "attrs": {"max_length": 512, "null": true}}, "mimetype": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "repo_path": {"type": "django.db.models.CharField", "attrs": {"max_length": 1024, "null": true}}, "repo_revision": {"type": "django.db.models.CharField", "attrs": {"max_length": 64, "null": true, "db_index": true}}, "repository": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "scmtools.Repository"}, "added_in_filediff": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "diffviewer.FileDiff"}, "attachment_history": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "attachments.FileAttachmentHistory"}, "attachment_revision": {"type": "django.db.models.IntegerField"}}, "meta": {"pk_column": "id", "db_table": "attachments_fileattachment", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "changedescs": {"legacy_app_label": "changedescs", "upgrade_method": "evolutions", "models": {"ChangeDescription": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "user": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "auth.User"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "public": {"type": "django.db.models.BooleanField"}, "text": {"type": "django.db.models.TextField"}, "rich_text": {"type": "django.db.models.BooleanField"}, "fields_changed": {"type": "djblets.db.fields.json_field.JSONField"}}, "meta": {"pk_column": "id", "db_table": "changedescs_changedescription", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "diffviewer": {"legacy_app_label": "diffviewer", "upgrade_method": "evolutions", "models": {"DiffSet": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "revision": {"type": "django.db.models.IntegerField"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "basedir": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "history": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "diffviewer.DiffSetHistory"}, "repository": {"type": "django.db.models.ForeignKey", "related_model": "scmtools.Repository"}, "diffcompat": {"type": "django.db.models.IntegerField"}, "base_commit_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 64, "null": true, "db_index": true}}, "commit_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "diffviewer_diffset", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "DiffCommit": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "filename": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "diffset": {"type": "django.db.models.ForeignKey", "related_model": "diffviewer.DiffSet"}, "author_name": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "author_email": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "author_date_utc": {"type": "django.db.models.DateTimeField"}, "author_date_offset": {"type": "django.db.models.IntegerField"}, "committer_name": {"type": "django.db.models.CharField", "attrs": {"max_length": 256, "null": true}}, "committer_email": {"type": "django.db.models.CharField", "attrs": {"max_length": 256, "null": true}}, "committer_date_utc": {"type": "django.db.models.DateTimeField", "attrs": {"null": true}}, "committer_date_offset": {"type": "django.db.models.IntegerField", "attrs": {"null": true}}, "commit_message": {"type": "django.db.models.TextField"}, "commit_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 64}}, "parent_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 64}}, "last_modified": {"type": "django.db.models.DateTimeField"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "diffviewer_diffcommit", "indexes": [], "db_tablespace": "", "unique_together": [["diffset", "commit_id"]], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "DiffSetHistory": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "timestamp": {"type": "django.db.models.DateTimeField"}, "last_diff_updated": {"type": "django.db.models.DateTimeField", "attrs": {"null": true}}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "diffviewer_diffsethistory", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "LegacyFileDiffData": {"fields": {"binary_hash": {"type": "django.db.models.CharField", "attrs": {"max_length": 40, "primary_key": true}}, "binary": {"type": "djblets.db.fields.base64_field.Base64Field"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}}, "meta": {"pk_column": "binary_hash", "db_table": "diffviewer_filediffdata", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "RawFileDiffData": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "binary_hash": {"type": "django.db.models.CharField", "attrs": {"max_length": 40, "unique": true}}, "binary": {"type": "django.db.models.BinaryField"}, "compression": {"type": "django.db.models.CharField", "attrs": {"max_length": 1, "null": true}}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "diffviewer_rawfilediffdata", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "FileDiff": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "diffset": {"type": "django.db.models.ForeignKey", "related_model": "diffviewer.DiffSet"}, "commit": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "diffviewer.DiffCommit"}, "source_file": {"type": "django.db.models.CharField", "attrs": {"max_length": 1024}}, "dest_file": {"type": "django.db.models.CharField", "attrs": {"max_length": 1024}}, "source_revision": {"type": "django.db.models.CharField", "attrs": {"max_length": 512}}, "dest_detail": {"type": "django.db.models.CharField", "attrs": {"max_length": 512}}, "binary": {"type": "django.db.models.BooleanField"}, "status": {"type": "django.db.models.CharField", "attrs": {"max_length": 1}}, "diff64": {"type": "djblets.db.fields.base64_field.Base64Field", "attrs": {"db_column": "diff_base64"}}, "legacy_diff_hash": {"type": "django.db.models.ForeignKey", "attrs": {"null": true, "db_column": "diff_hash_id"}, "related_model": "diffviewer.LegacyFileDiffData"}, "diff_hash": {"type": "django.db.models.ForeignKey", "attrs": {"null": true, "db_column": "raw_diff_hash_id"}, "related_model": "diffviewer.RawFileDiffData"}, "parent_diff64": {"type": "djblets.db.fields.base64_field.Base64Field", "attrs": {"db_column": "parent_diff_base64"}}, "legacy_parent_diff_hash": {"type": "django.db.models.ForeignKey", "attrs": {"null": true, "db_column": "parent_diff_hash_id"}, "related_model": "diffviewer.LegacyFileDiffData"}, "parent_diff_hash": {"type": "django.db.models.ForeignKey", "attrs": {"null": true, "db_column": "raw_parent_diff_hash_id"}, "related_model": "diffviewer.RawFileDiffData"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "diffviewer_filediff", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "hostingsvcs": {"legacy_app_label": "hostingsvcs", "upgrade_method": "evolutions", "models": {"HostingServiceAccount": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "service_name": {"type": "django.db.models.CharField", "attrs": {"max_length": 128}}, "hosting_url": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "null": true}}, "username": {"type": "django.db.models.CharField", "attrs": {"max_length": 128}}, "data": {"type": "djblets.db.fields.json_field.JSONField"}, "visible": {"type": "django.db.models.BooleanField"}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}}, "meta": {"pk_column": "id", "db_table": "hostingsvcs_hostingserviceaccount", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "integrations": {"legacy_app_label": "integrations", "models": {"IntegrationConfig": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "integration_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "db_index": true}}, "time_added": {"type": "django.db.models.DateTimeField"}, "last_updated": {"type": "django.db.models.DateTimeField"}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "null": true}}, "enabled": {"type": "django.db.models.BooleanField", "attrs": {"db_index": true}}, "settings": {"type": "djblets.db.fields.json_field.JSONField"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField"}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}}, "meta": {"pk_column": "id", "db_table": "integrations_integrationconfig", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "notifications": {"legacy_app_label": "notifications", "upgrade_method": "evolutions", "models": {"WebHookTarget": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "enabled": {"type": "django.db.models.BooleanField"}, "events": {"type": "multiselectfield.db.fields.MultiSelectField", "attrs": {"max_length": 105}}, "url": {"type": "django.db.models.URLField", "attrs": {"max_length": 200}}, "encoding": {"type": "django.db.models.CharField", "attrs": {"max_length": 40}}, "use_custom_content": {"type": "django.db.models.BooleanField"}, "custom_content": {"type": "django.db.models.TextField", "attrs": {"null": true}}, "secret": {"type": "django.db.models.CharField", "attrs": {"max_length": 128}}, "apply_to": {"type": "django.db.models.CharField", "attrs": {"max_length": 1}}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "repositories": {"type": "django.db.models.ManyToManyField", "related_model": "scmtools.Repository"}}, "meta": {"pk_column": "id", "db_table": "notifications_webhooktarget", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "oauth": {"legacy_app_label": "oauth", "upgrade_method": "evolutions", "models": {"Application": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "client_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 100, "unique": true, "db_index": true}}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "redirect_uris": {"type": "django.db.models.TextField"}, "client_type": {"type": "django.db.models.CharField", "attrs": {"max_length": 32}}, "authorization_grant_type": {"type": "django.db.models.CharField", "attrs": {"max_length": 32}}, "client_secret": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "db_index": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "skip_authorization": {"type": "django.db.models.BooleanField"}, "enabled": {"type": "django.db.models.BooleanField"}, "original_user": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "auth.User"}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "reviewboard_oauth_application", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "reviews": {"legacy_app_label": "reviews", "upgrade_method": "evolutions", "models": {"Group": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.SlugField", "attrs": {"max_length": 64, "db_index": true}}, "display_name": {"type": "django.db.models.CharField", "attrs": {"max_length": 64}}, "mailing_list": {"type": "django.db.models.CharField", "attrs": {"max_length": 254}}, "email_list_only": {"type": "django.db.models.BooleanField"}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "is_default_group": {"type": "django.db.models.BooleanField"}, "incoming_request_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "invite_only": {"type": "django.db.models.BooleanField"}, "visible": {"type": "django.db.models.BooleanField"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "users": {"type": "django.db.models.ManyToManyField", "related_model": "auth.User"}}, "meta": {"pk_column": "id", "db_table": "reviews_group", "indexes": [], "db_tablespace": "", "unique_together": [["name", "local_site"]], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "DefaultReviewer": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 64}}, "file_regex": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "repository": {"type": "django.db.models.ManyToManyField", "related_model": "scmtools.Repository"}, "groups": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Group"}, "people": {"type": "django.db.models.ManyToManyField", "related_model": "auth.User"}}, "meta": {"pk_column": "id", "db_table": "reviews_defaultreviewer", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "Comment": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "issue_opened": {"type": "django.db.models.BooleanField"}, "issue_status": {"type": "django.db.models.CharField", "attrs": {"max_length": 1, "null": true, "db_index": true}}, "reply_to": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "reviews.Comment"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "text": {"type": "django.db.models.TextField"}, "rich_text": {"type": "django.db.models.BooleanField"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "filediff": {"type": "django.db.models.ForeignKey", "related_model": "diffviewer.FileDiff"}, "interfilediff": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "diffviewer.FileDiff"}, "first_line": {"type": "django.db.models.PositiveIntegerField", "attrs": {"null": true}}, "num_lines": {"type": "django.db.models.PositiveIntegerField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "reviews_comment", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "FileAttachmentComment": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "issue_opened": {"type": "django.db.models.BooleanField"}, "issue_status": {"type": "django.db.models.CharField", "attrs": {"max_length": 1, "null": true, "db_index": true}}, "reply_to": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "reviews.FileAttachmentComment"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "text": {"type": "django.db.models.TextField"}, "rich_text": {"type": "django.db.models.BooleanField"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "file_attachment": {"type": "django.db.models.ForeignKey", "related_model": "attachments.FileAttachment"}, "diff_against_file_attachment": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "attachments.FileAttachment"}}, "meta": {"pk_column": "id", "db_table": "reviews_fileattachmentcomment", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "GeneralComment": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "issue_opened": {"type": "django.db.models.BooleanField"}, "issue_status": {"type": "django.db.models.CharField", "attrs": {"max_length": 1, "null": true, "db_index": true}}, "reply_to": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "reviews.GeneralComment"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "text": {"type": "django.db.models.TextField"}, "rich_text": {"type": "django.db.models.BooleanField"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "reviews_generalcomment", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "Screenshot": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "caption": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "draft_caption": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "image": {"type": "django.db.models.ImageField", "attrs": {"max_length": 100}}}, "meta": {"pk_column": "id", "db_table": "reviews_screenshot", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "ReviewRequest": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "description": {"type": "django.db.models.TextField"}, "description_rich_text": {"type": "django.db.models.BooleanField"}, "testing_done": {"type": "django.db.models.TextField"}, "testing_done_rich_text": {"type": "django.db.models.BooleanField"}, "bugs_closed": {"type": "django.db.models.CharField", "attrs": {"max_length": 300}}, "branch": {"type": "django.db.models.CharField", "attrs": {"max_length": 300}}, "commit_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 64, "null": true, "db_index": true}}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "rich_text": {"type": "django.db.models.BooleanField"}, "summary": {"type": "django.db.models.CharField", "attrs": {"max_length": 300}}, "submitter": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "time_added": {"type": "django.db.models.DateTimeField"}, "last_updated": {"type": "djblets.db.fields.modification_timestamp_field.ModificationTimestampField"}, "status": {"type": "django.db.models.CharField", "attrs": {"max_length": 1, "db_index": true}}, "public": {"type": "django.db.models.BooleanField"}, "changenum": {"type": "django.db.models.PositiveIntegerField", "attrs": {"null": true, "db_index": true}}, "repository": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "scmtools.Repository"}, "email_message_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "null": true}}, "time_emailed": {"type": "django.db.models.DateTimeField", "attrs": {"null": true}}, "diffset_history": {"type": "django.db.models.ForeignKey", "related_model": "diffviewer.DiffSetHistory"}, "last_review_activity_timestamp": {"type": "django.db.models.DateTimeField", "attrs": {"null": true, "db_column": "last_review_timestamp"}}, "shipit_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "issue_open_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "issue_resolved_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "issue_dropped_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "issue_verifying_count": {"type": "djblets.db.fields.counter_field.CounterField", "attrs": {"null": true}}, "screenshots_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "inactive_screenshots_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "file_attachments_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "inactive_file_attachments_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "local_id": {"type": "django.db.models.IntegerField", "attrs": {"null": true}}, "target_groups": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Group"}, "target_people": {"type": "django.db.models.ManyToManyField", "related_model": "auth.User"}, "screenshots": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Screenshot"}, "inactive_screenshots": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Screenshot"}, "file_attachments": {"type": "django.db.models.ManyToManyField", "related_model": "attachments.FileAttachment"}, "inactive_file_attachments": {"type": "django.db.models.ManyToManyField", "related_model": "attachments.FileAttachment"}, "file_attachment_histories": {"type": "django.db.models.ManyToManyField", "related_model": "attachments.FileAttachmentHistory"}, "changedescs": {"type": "django.db.models.ManyToManyField", "related_model": "changedescs.ChangeDescription"}, "depends_on": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.ReviewRequest"}}, "meta": {"pk_column": "id", "db_table": "reviews_reviewrequest", "indexes": [], "db_tablespace": "", "unique_together": [["commit_id", "repository"], ["changenum", "repository"], ["local_site", "local_id"]], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "ScreenshotComment": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "issue_opened": {"type": "django.db.models.BooleanField"}, "issue_status": {"type": "django.db.models.CharField", "attrs": {"max_length": 1, "null": true, "db_index": true}}, "reply_to": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "reviews.ScreenshotComment"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "text": {"type": "django.db.models.TextField"}, "rich_text": {"type": "django.db.models.BooleanField"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "screenshot": {"type": "django.db.models.ForeignKey", "related_model": "reviews.Screenshot"}, "x": {"type": "django.db.models.PositiveSmallIntegerField", "attrs": {"null": true}}, "y": {"type": "django.db.models.PositiveSmallIntegerField"}, "w": {"type": "django.db.models.PositiveSmallIntegerField"}, "h": {"type": "django.db.models.PositiveSmallIntegerField"}}, "meta": {"pk_column": "id", "db_table": "reviews_screenshotcomment", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "Review": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "review_request": {"type": "django.db.models.ForeignKey", "related_model": "reviews.ReviewRequest"}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "public": {"type": "django.db.models.BooleanField"}, "ship_it": {"type": "django.db.models.BooleanField"}, "base_reply_to": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "reviews.Review"}, "email_message_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 255, "null": true}}, "time_emailed": {"type": "django.db.models.DateTimeField", "attrs": {"null": true}}, "body_top": {"type": "django.db.models.TextField"}, "body_top_rich_text": {"type": "django.db.models.BooleanField"}, "body_bottom": {"type": "django.db.models.TextField"}, "body_bottom_rich_text": {"type": "django.db.models.BooleanField"}, "body_top_reply_to": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "reviews.Review"}, "body_bottom_reply_to": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "reviews.Review"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "rich_text": {"type": "django.db.models.BooleanField"}, "reviewed_diffset": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "diffviewer.DiffSet"}, "comments": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Comment"}, "screenshot_comments": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.ScreenshotComment"}, "file_attachment_comments": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.FileAttachmentComment"}, "general_comments": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.GeneralComment"}}, "meta": {"pk_column": "id", "db_table": "reviews_review", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "ReviewRequestDraft": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "description": {"type": "django.db.models.TextField"}, "description_rich_text": {"type": "django.db.models.BooleanField"}, "testing_done": {"type": "django.db.models.TextField"}, "testing_done_rich_text": {"type": "django.db.models.BooleanField"}, "bugs_closed": {"type": "django.db.models.CharField", "attrs": {"max_length": 300}}, "branch": {"type": "django.db.models.CharField", "attrs": {"max_length": 300}}, "commit_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 64, "null": true, "db_index": true}}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "rich_text": {"type": "django.db.models.BooleanField"}, "summary": {"type": "django.db.models.CharField", "attrs": {"max_length": 300}}, "owner": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "auth.User"}, "review_request": {"type": "django.db.models.ForeignKey", "attrs": {"unique": true}, "related_model": "reviews.ReviewRequest"}, "last_updated": {"type": "djblets.db.fields.modification_timestamp_field.ModificationTimestampField"}, "diffset": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "diffviewer.DiffSet"}, "changedesc": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "changedescs.ChangeDescription"}, "screenshots_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "inactive_screenshots_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "file_attachments_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "inactive_file_attachments_count": {"type": "djblets.db.fields.relation_counter_field.RelationCounterField", "attrs": {"null": true}}, "target_groups": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Group"}, "target_people": {"type": "django.db.models.ManyToManyField", "related_model": "auth.User"}, "screenshots": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Screenshot"}, "inactive_screenshots": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Screenshot"}, "file_attachments": {"type": "django.db.models.ManyToManyField", "related_model": "attachments.FileAttachment"}, "inactive_file_attachments": {"type": "django.db.models.ManyToManyField", "related_model": "attachments.FileAttachment"}, "depends_on": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.ReviewRequest"}}, "meta": {"pk_column": "id", "db_table": "reviews_reviewrequestdraft", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "StatusUpdate": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "service_id": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "user": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "auth.User"}, "timestamp": {"type": "django.db.models.DateTimeField"}, "summary": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "description": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "url": {"type": "django.db.models.URLField", "attrs": {"max_length": 255}}, "url_text": {"type": "django.db.models.CharField", "attrs": {"max_length": 64}}, "state": {"type": "django.db.models.CharField", "attrs": {"max_length": 1}}, "review_request": {"type": "django.db.models.ForeignKey", "related_model": "reviews.ReviewRequest"}, "change_description": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "changedescs.ChangeDescription"}, "review": {"type": "django.db.models.OneToOneField", "attrs": {"unique": true, "null": true}, "related_model": "reviews.Review"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "timeout": {"type": "django.db.models.IntegerField", "attrs": {"null": true}}}, "meta": {"pk_column": "id", "db_table": "reviews_statusupdate", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "scmtools": {"legacy_app_label": "scmtools", "upgrade_method": "evolutions", "models": {"Tool": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 32, "unique": true}}, "class_name": {"type": "django.db.models.CharField", "attrs": {"max_length": 128, "unique": true}}}, "meta": {"pk_column": "id", "db_table": "scmtools_tool", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}, "Repository": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "path": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "mirror_path": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "raw_file_url": {"type": "django.db.models.CharField", "attrs": {"max_length": 255}}, "username": {"type": "django.db.models.CharField", "attrs": {"max_length": 32}}, "encrypted_password": {"type": "django.db.models.CharField", "attrs": {"max_length": 128, "db_column": "password"}}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "tool": {"type": "django.db.models.ForeignKey", "related_model": "scmtools.Tool"}, "hosting_account": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "hostingsvcs.HostingServiceAccount"}, "bug_tracker": {"type": "django.db.models.CharField", "attrs": {"max_length": 256}}, "encoding": {"type": "django.db.models.CharField", "attrs": {"max_length": 32}}, "visible": {"type": "django.db.models.BooleanField"}, "archived": {"type": "django.db.models.BooleanField"}, "archived_timestamp": {"type": "django.db.models.DateTimeField", "attrs": {"null": true}}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}, "public": {"type": "django.db.models.BooleanField"}, "hooks_uuid": {"type": "django.db.models.CharField", "attrs": {"max_length": 32, "null": true}}, "users": {"type": "django.db.models.ManyToManyField", "related_model": "auth.User"}, "review_groups": {"type": "django.db.models.ManyToManyField", "related_model": "reviews.Group"}}, "meta": {"pk_column": "id", "db_table": "scmtools_repository", "indexes": [], "db_tablespace": "", "unique_together": [["name", "local_site"], ["archived_timestamp", "path", "local_site"], ["hooks_uuid", "local_site"]], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "site": {"legacy_app_label": "site", "upgrade_method": "evolutions", "models": {"LocalSite": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "name": {"type": "django.db.models.SlugField", "attrs": {"max_length": 32, "unique": true, "db_index": true}}, "public": {"type": "django.db.models.BooleanField"}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "users": {"type": "django.db.models.ManyToManyField", "related_model": "auth.User"}, "admins": {"type": "django.db.models.ManyToManyField", "related_model": "auth.User"}}, "meta": {"pk_column": "id", "db_table": "site_localsite", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}, "webapi": {"legacy_app_label": "webapi", "upgrade_method": "evolutions", "models": {"WebAPIToken": {"fields": {"id": {"type": "django.db.models.AutoField", "attrs": {"primary_key": true}}, "user": {"type": "django.db.models.ForeignKey", "related_model": "auth.User"}, "token": {"type": "django.db.models.CharField", "attrs": {"max_length": 40, "unique": true}}, "time_added": {"type": "django.db.models.DateTimeField"}, "last_updated": {"type": "django.db.models.DateTimeField"}, "note": {"type": "django.db.models.TextField"}, "policy": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "extra_data": {"type": "djblets.db.fields.json_field.JSONField", "attrs": {"null": true}}, "local_site": {"type": "django.db.models.ForeignKey", "attrs": {"null": true}, "related_model": "site.LocalSite"}}, "meta": {"pk_column": "id", "db_table": "webapi_webapitoken", "indexes": [], "db_tablespace": "", "unique_together": [], "__unique_together_applied": true, "index_together": [], "constraints": []}}}}}}	2022-05-16 00:53:18.899207+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: djblets_privacy_storedconsentdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djblets_privacy_storedconsentdata (id, user_id, audit_identifier, time_added, last_updated, consent_grants, audit_trail) FROM stdin;
\.


--
-- Data for Name: extensions_registeredextension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extensions_registeredextension (id, class_name, name, enabled, installed, settings) FROM stdin;
\.


--
-- Data for Name: hostingsvcs_hostingserviceaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hostingsvcs_hostingserviceaccount (id, service_name, hosting_url, username, data, visible, local_site_id) FROM stdin;
\.


--
-- Data for Name: integrations_integrationconfig; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.integrations_integrationconfig (id, integration_id, time_added, last_updated, name, enabled, settings, extra_data, local_site_id) FROM stdin;
\.


--
-- Data for Name: notifications_webhooktarget; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications_webhooktarget (id, enabled, events, url, encoding, use_custom_content, custom_content, secret, apply_to, local_site_id, extra_data) FROM stdin;
\.


--
-- Data for Name: notifications_webhooktarget_repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications_webhooktarget_repositories (id, webhooktarget_id, repository_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviewboard_oauth_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviewboard_oauth_application (id, client_id, user_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, skip_authorization, enabled, original_user_id, local_site_id, extra_data) FROM stdin;
\.


--
-- Data for Name: reviews_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_comment (id, issue_opened, issue_status, reply_to_id, "timestamp", text, rich_text, extra_data, filediff_id, interfilediff_id, first_line, num_lines) FROM stdin;
\.


--
-- Data for Name: reviews_defaultreviewer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_defaultreviewer (id, name, file_regex, local_site_id) FROM stdin;
\.


--
-- Data for Name: reviews_defaultreviewer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_defaultreviewer_groups (id, defaultreviewer_id, group_id) FROM stdin;
\.


--
-- Data for Name: reviews_defaultreviewer_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_defaultreviewer_people (id, defaultreviewer_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_defaultreviewer_repository; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_defaultreviewer_repository (id, defaultreviewer_id, repository_id) FROM stdin;
\.


--
-- Data for Name: reviews_fileattachmentcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_fileattachmentcomment (id, issue_opened, issue_status, reply_to_id, "timestamp", text, rich_text, extra_data, file_attachment_id, diff_against_file_attachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_generalcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_generalcomment (id, issue_opened, issue_status, reply_to_id, "timestamp", text, rich_text, extra_data) FROM stdin;
\.


--
-- Data for Name: reviews_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_group (id, name, display_name, mailing_list, email_list_only, local_site_id, is_default_group, incoming_request_count, invite_only, visible, extra_data) FROM stdin;
\.


--
-- Data for Name: reviews_group_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_group_users (id, group_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review (id, review_request_id, user_id, "timestamp", public, ship_it, base_reply_to_id, email_message_id, time_emailed, body_top, body_top_rich_text, body_bottom, body_bottom_rich_text, body_top_reply_to_id, body_bottom_reply_to_id, extra_data, rich_text, reviewed_diffset_id) FROM stdin;
\.


--
-- Data for Name: reviews_review_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review_comments (id, review_id, comment_id) FROM stdin;
\.


--
-- Data for Name: reviews_review_file_attachment_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review_file_attachment_comments (id, review_id, fileattachmentcomment_id) FROM stdin;
\.


--
-- Data for Name: reviews_review_general_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review_general_comments (id, review_id, generalcomment_id) FROM stdin;
\.


--
-- Data for Name: reviews_review_screenshot_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review_screenshot_comments (id, review_id, screenshotcomment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest (id, description, description_rich_text, testing_done, testing_done_rich_text, bugs_closed, branch, commit_id, extra_data, rich_text, summary, submitter_id, time_added, last_updated, status, public, changenum, repository_id, email_message_id, time_emailed, diffset_history_id, last_review_timestamp, shipit_count, issue_open_count, issue_resolved_count, issue_dropped_count, issue_verifying_count, screenshots_count, inactive_screenshots_count, file_attachments_count, inactive_file_attachments_count, local_site_id, local_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_changedescs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_changedescs (id, reviewrequest_id, changedescription_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_depends_on; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_depends_on (id, from_reviewrequest_id, to_reviewrequest_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_file_attachment_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_file_attachment_histories (id, reviewrequest_id, fileattachmenthistory_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_file_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_file_attachments (id, reviewrequest_id, fileattachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_inactive_file_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_inactive_file_attachments (id, reviewrequest_id, fileattachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_inactive_screenshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_inactive_screenshots (id, reviewrequest_id, screenshot_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_screenshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_screenshots (id, reviewrequest_id, screenshot_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_target_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_target_groups (id, reviewrequest_id, group_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequest_target_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequest_target_people (id, reviewrequest_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft (id, description, description_rich_text, testing_done, testing_done_rich_text, bugs_closed, branch, commit_id, extra_data, rich_text, summary, owner_id, review_request_id, last_updated, diffset_id, changedesc_id, screenshots_count, inactive_screenshots_count, file_attachments_count, inactive_file_attachments_count) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_depends_on; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_depends_on (id, reviewrequestdraft_id, reviewrequest_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_file_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_file_attachments (id, reviewrequestdraft_id, fileattachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_inactive_file_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_inactive_file_attachments (id, reviewrequestdraft_id, fileattachment_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_inactive_screenshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_inactive_screenshots (id, reviewrequestdraft_id, screenshot_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_screenshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_screenshots (id, reviewrequestdraft_id, screenshot_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_target_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_target_groups (id, reviewrequestdraft_id, group_id) FROM stdin;
\.


--
-- Data for Name: reviews_reviewrequestdraft_target_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_reviewrequestdraft_target_people (id, reviewrequestdraft_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_screenshot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_screenshot (id, caption, draft_caption, image) FROM stdin;
\.


--
-- Data for Name: reviews_screenshotcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_screenshotcomment (id, issue_opened, issue_status, reply_to_id, "timestamp", text, rich_text, extra_data, screenshot_id, x, y, w, h) FROM stdin;
\.


--
-- Data for Name: reviews_statusupdate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_statusupdate (id, service_id, user_id, "timestamp", summary, description, url, url_text, state, review_request_id, change_description_id, review_id, extra_data, timeout) FROM stdin;
\.


--
-- Data for Name: scmtools_repository; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scmtools_repository (id, name, path, mirror_path, raw_file_url, username, password, extra_data, tool_id, hosting_account_id, bug_tracker, encoding, visible, archived, archived_timestamp, local_site_id, public, hooks_uuid) FROM stdin;
\.


--
-- Data for Name: scmtools_repository_review_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scmtools_repository_review_groups (id, repository_id, group_id) FROM stdin;
\.


--
-- Data for Name: scmtools_repository_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scmtools_repository_users (id, repository_id, user_id) FROM stdin;
\.


--
-- Data for Name: scmtools_tool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scmtools_tool (id, name, class_name) FROM stdin;
1	Subversion	reviewboard.scmtools.svn.SVNTool
2	Git	reviewboard.scmtools.git.GitTool
3	Bazaar	reviewboard.scmtools.bzr.BZRTool
4	CVS	reviewboard.scmtools.cvs.CVSTool
5	Perforce	reviewboard.scmtools.perforce.PerforceTool
6	Plastic SCM	reviewboard.scmtools.plastic.PlasticTool
7	ClearCase	reviewboard.scmtools.clearcase.ClearCaseTool
8	Mercurial	reviewboard.scmtools.hg.HgTool
9	Cliosoft SOS	rbpowerpack.scmtools.cliosoft_sos.scmtool.CliosoftSOSTool
10	VersionVault / ClearCase	rbpowerpack.scmtools.versionvault.VersionVaultTool
11	Team Foundation Server	rbpowerpack.scmtools.tfs.TFSTool
12	Team Foundation Server (git)	rbpowerpack.scmtools.tfs_git.TFSGitTool
\.


--
-- Data for Name: site_localsite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_localsite (id, name, public, extra_data) FROM stdin;
\.


--
-- Data for Name: site_localsite_admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_localsite_admins (id, localsite_id, user_id) FROM stdin;
\.


--
-- Data for Name: site_localsite_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_localsite_users (id, localsite_id, user_id) FROM stdin;
\.


--
-- Data for Name: siteconfig_siteconfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siteconfig_siteconfiguration (id, site_id, version, settings) FROM stdin;
1	1	4.0.6	{"auth_ad_domain_controller": null, "auth_ad_domain_name": null, "auth_ad_find_dc_from_dns": null, "auth_ad_group_name": null, "auth_ad_ou_name": null, "auth_ad_recursion_depth": null, "auth_ad_search_root": null, "auth_ad_use_tls": null, "auth_backend": "builtin", "auth_digest_file_location": null, "auth_digest_realm": null, "auth_ldap_anon_bind_passwd": "", "auth_ldap_anon_bind_uid": "", "auth_ldap_base_dn": null, "auth_ldap_email_attribute": null, "auth_ldap_email_domain": "", "auth_ldap_full_name_attribute": null, "auth_ldap_given_name_attribute": null, "auth_ldap_surname_attribute": null, "auth_ldap_tls": false, "auth_ldap_uid": "uid", "auth_ldap_uid_mask": "", "auth_ldap_uri": "", "auth_nis_email_domain": "", "auth_require_sitewide_login": false, "auth_x509_autocreate_users": false, "auth_x509_custom_username_field": null, "auth_x509_username_field": "SSL_CLIENT_S_DN_CN", "auth_x509_username_regex": "", "aws_access_key_id": "", "aws_calling_format": 2, "aws_default_acl": "public-read", "aws_headers": {}, "aws_querystring_active": false, "aws_querystring_auth": false, "aws_querystring_expire": 60, "aws_s3_bucket_name": "", "aws_s3_secure_urls": false, "aws_secret_access_key": "", "cache_backend": {"default": {"BACKEND": "djblets.cache.forwarding_backend.ForwardingCacheBackend", "LOCATION": "forwarded_backend"}, "forwarded_backend": {"BACKEND": "django.core.cache.backends.locmem.LocMemCache", "LOCATION": "reviewboard"}, "staticfiles": {"BACKEND": "django.core.cache.backends.locmem.LocMemCache", "LOCATION": "staticfiles-filehashes"}}, "cache_expiration_time": 2592000, "couchdb_default_server": "", "couchdb_storage_options": {}, "diffviewer_context_num_lines": 5, "diffviewer_include_space_patterns": [], "diffviewer_paginate_by": 20, "diffviewer_paginate_orphans": 10, "diffviewer_syntax_highlighting": true, "locale_date_format": "N j, Y", "locale_datetime_format": "N j, Y, P", "locale_default_charset": "utf-8", "locale_language_code": "en-us", "locale_month_day_format": "F j", "locale_time_format": "P", "locale_timezone": "UTC", "locale_year_month_format": "F Y", "logging_allow_profiling": false, "logging_directory": null, "logging_enabled": true, "logging_level": "DEBUG", "mail_default_from": "webmaster@localhost", "mail_host": "localhost", "mail_host_password": "", "mail_host_user": "", "mail_port": 25, "mail_send_review_mail": false, "mail_server_address": "root@localhost", "mail_use_tls": false, "recaptcha_private_key": null, "recaptcha_public_key": null, "search_enable": false, "search_index_file": null, "site_admin_email": "admin@example.com", "site_admin_name": "Example Admin", "site_domain_method": "http", "site_media_root": "/site/htdocs/media", "site_media_url": "/media/", "site_prepend_www": false, "site_static_root": "/site/htdocs/static", "site_static_url": "/static/", "site_upload_max_memory_size": 2621440, "site_upload_temp_dir": null, "swift_auth_url": "", "swift_auth_version": "1", "swift_container_name": "", "swift_key": "", "swift_username": ""}
\.


--
-- Data for Name: webapi_webapitoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webapi_webapitoken (id, user_id, token, time_added, last_updated, note, policy, extra_data, local_site_id) FROM stdin;
\.


--
-- Name: accounts_localsiteprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_localsiteprofile_id_seq', 1, false);


--
-- Name: accounts_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_profile_id_seq', 1, false);


--
-- Name: accounts_profile_starred_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_profile_starred_groups_id_seq', 1, false);


--
-- Name: accounts_profile_starred_review_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_profile_starred_review_requests_id_seq', 1, false);


--
-- Name: accounts_reviewrequestvisit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_reviewrequestvisit_id_seq', 1, false);


--
-- Name: accounts_trophy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_trophy_id_seq', 1, false);


--
-- Name: attachments_fileattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_fileattachment_id_seq', 1, false);


--
-- Name: attachments_fileattachmenthistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_fileattachmenthistory_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 151, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: changedescs_changedescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.changedescs_changedescription_id_seq', 1, false);


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.corsheaders_corsmodel_id_seq', 1, false);


--
-- Name: diffviewer_diffcommit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_diffcommit_id_seq', 1, false);


--
-- Name: diffviewer_diffset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_diffset_id_seq', 1, false);


--
-- Name: diffviewer_diffsethistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_diffsethistory_id_seq', 1, false);


--
-- Name: diffviewer_filediff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_filediff_id_seq', 1, false);


--
-- Name: diffviewer_rawfilediffdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diffviewer_rawfilediffdata_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 49, true);


--
-- Name: django_evolution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_evolution_id_seq', 110, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: django_project_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_project_version_id_seq', 1, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: djblets_privacy_storedconsentdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djblets_privacy_storedconsentdata_id_seq', 1, false);


--
-- Name: extensions_registeredextension_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extensions_registeredextension_id_seq', 1, false);


--
-- Name: hostingsvcs_hostingserviceaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hostingsvcs_hostingserviceaccount_id_seq', 1, false);


--
-- Name: integrations_integrationconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.integrations_integrationconfig_id_seq', 1, false);


--
-- Name: notifications_webhooktarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_webhooktarget_id_seq', 1, false);


--
-- Name: notifications_webhooktarget_repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_webhooktarget_repositories_id_seq', 1, false);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: reviewboard_oauth_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviewboard_oauth_application_id_seq', 1, false);


--
-- Name: reviews_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_comment_id_seq', 1, false);


--
-- Name: reviews_defaultreviewer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_defaultreviewer_groups_id_seq', 1, false);


--
-- Name: reviews_defaultreviewer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_defaultreviewer_id_seq', 1, false);


--
-- Name: reviews_defaultreviewer_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_defaultreviewer_people_id_seq', 1, false);


--
-- Name: reviews_defaultreviewer_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_defaultreviewer_repository_id_seq', 1, false);


--
-- Name: reviews_fileattachmentcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_fileattachmentcomment_id_seq', 1, false);


--
-- Name: reviews_generalcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_generalcomment_id_seq', 1, false);


--
-- Name: reviews_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_group_id_seq', 1, false);


--
-- Name: reviews_group_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_group_users_id_seq', 1, false);


--
-- Name: reviews_review_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_comments_id_seq', 1, false);


--
-- Name: reviews_review_file_attachment_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_file_attachment_comments_id_seq', 1, false);


--
-- Name: reviews_review_general_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_general_comments_id_seq', 1, false);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, false);


--
-- Name: reviews_review_screenshot_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_screenshot_comments_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_changedescs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_changedescs_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_depends_on_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_depends_on_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_file_attachment_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_file_attachment_histories_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_file_attachments_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_inactive_file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_inactive_file_attachments_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_inactive_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_inactive_screenshots_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_screenshots_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_target_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_target_groups_id_seq', 1, false);


--
-- Name: reviews_reviewrequest_target_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequest_target_people_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_depends_on_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_depends_on_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_file_attachments_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_inactive_file_attachments_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_inactive_screenshots_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_screenshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_screenshots_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_target_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_target_groups_id_seq', 1, false);


--
-- Name: reviews_reviewrequestdraft_target_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewrequestdraft_target_people_id_seq', 1, false);


--
-- Name: reviews_screenshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_screenshot_id_seq', 1, false);


--
-- Name: reviews_screenshotcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_screenshotcomment_id_seq', 1, false);


--
-- Name: reviews_statusupdate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_statusupdate_id_seq', 1, false);


--
-- Name: scmtools_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scmtools_repository_id_seq', 1, false);


--
-- Name: scmtools_repository_review_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scmtools_repository_review_groups_id_seq', 1, false);


--
-- Name: scmtools_repository_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scmtools_repository_users_id_seq', 1, false);


--
-- Name: scmtools_tool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scmtools_tool_id_seq', 12, true);


--
-- Name: site_localsite_admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_localsite_admins_id_seq', 1, false);


--
-- Name: site_localsite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_localsite_id_seq', 1, false);


--
-- Name: site_localsite_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_localsite_users_id_seq', 1, false);


--
-- Name: siteconfig_siteconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siteconfig_siteconfiguration_id_seq', 1, true);


--
-- Name: webapi_webapitoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webapi_webapitoken_id_seq', 1, false);


--
-- Name: accounts_localsiteprofile accounts_localsiteprofil_profile_id_local_site_id_c35a7283_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofil_profile_id_local_site_id_c35a7283_uniq UNIQUE (profile_id, local_site_id);


--
-- Name: accounts_localsiteprofile accounts_localsiteprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_localsiteprofile accounts_localsiteprofile_user_id_local_site_id_c71acfac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofile_user_id_local_site_id_c71acfac_uniq UNIQUE (user_id, local_site_id);


--
-- Name: accounts_profile accounts_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile_starred_groups accounts_profile_starred_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups
    ADD CONSTRAINT accounts_profile_starred_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile_starred_groups accounts_profile_starred_profile_id_group_id_82d5c8c2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups
    ADD CONSTRAINT accounts_profile_starred_profile_id_group_id_82d5c8c2_uniq UNIQUE (profile_id, group_id);


--
-- Name: accounts_profile_starred_review_requests accounts_profile_starred_profile_id_reviewrequest_9077f978_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests
    ADD CONSTRAINT accounts_profile_starred_profile_id_reviewrequest_9077f978_uniq UNIQUE (profile_id, reviewrequest_id);


--
-- Name: accounts_profile_starred_review_requests accounts_profile_starred_review_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests
    ADD CONSTRAINT accounts_profile_starred_review_requests_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile accounts_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);


--
-- Name: accounts_reviewrequestvisit accounts_reviewrequestvi_user_id_review_request_i_5b8724f0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit
    ADD CONSTRAINT accounts_reviewrequestvi_user_id_review_request_i_5b8724f0_uniq UNIQUE (user_id, review_request_id);


--
-- Name: accounts_reviewrequestvisit accounts_reviewrequestvisit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit
    ADD CONSTRAINT accounts_reviewrequestvisit_pkey PRIMARY KEY (id);


--
-- Name: accounts_trophy accounts_trophy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy
    ADD CONSTRAINT accounts_trophy_pkey PRIMARY KEY (id);


--
-- Name: attachments_fileattachment attachments_fileattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileattachment_pkey PRIMARY KEY (id);


--
-- Name: attachments_fileattachmenthistory attachments_fileattachmenthistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachmenthistory
    ADD CONSTRAINT attachments_fileattachmenthistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: changedescs_changedescription changedescs_changedescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changedescs_changedescription
    ADD CONSTRAINT changedescs_changedescription_pkey PRIMARY KEY (id);


--
-- Name: corsheaders_corsmodel corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_diffcommit diffviewer_diffcommit_diffset_id_commit_id_61b21cc8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffcommit
    ADD CONSTRAINT diffviewer_diffcommit_diffset_id_commit_id_61b21cc8_uniq UNIQUE (diffset_id, commit_id);


--
-- Name: diffviewer_diffcommit diffviewer_diffcommit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffcommit
    ADD CONSTRAINT diffviewer_diffcommit_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_diffset diffviewer_diffset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffset
    ADD CONSTRAINT diffviewer_diffset_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_diffsethistory diffviewer_diffsethistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffsethistory
    ADD CONSTRAINT diffviewer_diffsethistory_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_filediff diffviewer_filediff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_pkey PRIMARY KEY (id);


--
-- Name: diffviewer_filediffdata diffviewer_filediffdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediffdata
    ADD CONSTRAINT diffviewer_filediffdata_pkey PRIMARY KEY (binary_hash);


--
-- Name: diffviewer_rawfilediffdata diffviewer_rawfilediffdata_binary_hash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_rawfilediffdata
    ADD CONSTRAINT diffviewer_rawfilediffdata_binary_hash_key UNIQUE (binary_hash);


--
-- Name: diffviewer_rawfilediffdata diffviewer_rawfilediffdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_rawfilediffdata
    ADD CONSTRAINT diffviewer_rawfilediffdata_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_evolution django_evolution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_evolution
    ADD CONSTRAINT django_evolution_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_project_version django_project_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_project_version
    ADD CONSTRAINT django_project_version_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djblets_privacy_storedconsentdata djblets_privacy_storedconsentdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djblets_privacy_storedconsentdata
    ADD CONSTRAINT djblets_privacy_storedconsentdata_pkey PRIMARY KEY (id);


--
-- Name: djblets_privacy_storedconsentdata djblets_privacy_storedconsentdata_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djblets_privacy_storedconsentdata
    ADD CONSTRAINT djblets_privacy_storedconsentdata_user_id_key UNIQUE (user_id);


--
-- Name: extensions_registeredextension extensions_registeredextension_class_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extensions_registeredextension
    ADD CONSTRAINT extensions_registeredextension_class_name_key UNIQUE (class_name);


--
-- Name: extensions_registeredextension extensions_registeredextension_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extensions_registeredextension
    ADD CONSTRAINT extensions_registeredextension_pkey PRIMARY KEY (id);


--
-- Name: hostingsvcs_hostingserviceaccount hostingsvcs_hostingserviceaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostingsvcs_hostingserviceaccount
    ADD CONSTRAINT hostingsvcs_hostingserviceaccount_pkey PRIMARY KEY (id);


--
-- Name: integrations_integrationconfig integrations_integrationconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_integrationconfig
    ADD CONSTRAINT integrations_integrationconfig_pkey PRIMARY KEY (id);


--
-- Name: notifications_webhooktarget_repositories notifications_webhooktar_webhooktarget_id_reposit_e4f9af06_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories
    ADD CONSTRAINT notifications_webhooktar_webhooktarget_id_reposit_e4f9af06_uniq UNIQUE (webhooktarget_id, repository_id);


--
-- Name: notifications_webhooktarget notifications_webhooktarget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget
    ADD CONSTRAINT notifications_webhooktarget_pkey PRIMARY KEY (id);


--
-- Name: notifications_webhooktarget_repositories notifications_webhooktarget_repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories
    ADD CONSTRAINT notifications_webhooktarget_repositories_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: reviewboard_oauth_application reviewboard_oauth_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_application_client_id_key UNIQUE (client_id);


--
-- Name: reviewboard_oauth_application reviewboard_oauth_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_application_pkey PRIMARY KEY (id);


--
-- Name: reviews_comment reviews_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_pkey PRIMARY KEY (id);


--
-- Name: reviews_defaultreviewer_groups reviews_defaultreviewer__defaultreviewer_id_group_f85e51ee_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups
    ADD CONSTRAINT reviews_defaultreviewer__defaultreviewer_id_group_f85e51ee_uniq UNIQUE (defaultreviewer_id, group_id);


--
-- Name: reviews_defaultreviewer_repository reviews_defaultreviewer__defaultreviewer_id_repos_532b4c10_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository
    ADD CONSTRAINT reviews_defaultreviewer__defaultreviewer_id_repos_532b4c10_uniq UNIQUE (defaultreviewer_id, repository_id);


--
-- Name: reviews_defaultreviewer_people reviews_defaultreviewer__defaultreviewer_id_user__f22a3474_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people
    ADD CONSTRAINT reviews_defaultreviewer__defaultreviewer_id_user__f22a3474_uniq UNIQUE (defaultreviewer_id, user_id);


--
-- Name: reviews_defaultreviewer_groups reviews_defaultreviewer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups
    ADD CONSTRAINT reviews_defaultreviewer_groups_pkey PRIMARY KEY (id);


--
-- Name: reviews_defaultreviewer_people reviews_defaultreviewer_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people
    ADD CONSTRAINT reviews_defaultreviewer_people_pkey PRIMARY KEY (id);


--
-- Name: reviews_defaultreviewer reviews_defaultreviewer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer
    ADD CONSTRAINT reviews_defaultreviewer_pkey PRIMARY KEY (id);


--
-- Name: reviews_defaultreviewer_repository reviews_defaultreviewer_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository
    ADD CONSTRAINT reviews_defaultreviewer_repository_pkey PRIMARY KEY (id);


--
-- Name: reviews_fileattachmentcomment reviews_fileattachmentcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment
    ADD CONSTRAINT reviews_fileattachmentcomment_pkey PRIMARY KEY (id);


--
-- Name: reviews_generalcomment reviews_generalcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_generalcomment
    ADD CONSTRAINT reviews_generalcomment_pkey PRIMARY KEY (id);


--
-- Name: reviews_group reviews_group_name_local_site_id_cd520124_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group
    ADD CONSTRAINT reviews_group_name_local_site_id_cd520124_uniq UNIQUE (name, local_site_id);


--
-- Name: reviews_group reviews_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group
    ADD CONSTRAINT reviews_group_pkey PRIMARY KEY (id);


--
-- Name: reviews_group_users reviews_group_users_group_id_user_id_1710047c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users
    ADD CONSTRAINT reviews_group_users_group_id_user_id_1710047c_uniq UNIQUE (group_id, user_id);


--
-- Name: reviews_group_users reviews_group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users
    ADD CONSTRAINT reviews_group_users_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_comments reviews_review_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments
    ADD CONSTRAINT reviews_review_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_comments reviews_review_comments_review_id_comment_id_2b6b67b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments
    ADD CONSTRAINT reviews_review_comments_review_id_comment_id_2b6b67b0_uniq UNIQUE (review_id, comment_id);


--
-- Name: reviews_review_file_attachment_comments reviews_review_file_atta_review_id_fileattachment_e50f6c80_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments
    ADD CONSTRAINT reviews_review_file_atta_review_id_fileattachment_e50f6c80_uniq UNIQUE (review_id, fileattachmentcomment_id);


--
-- Name: reviews_review_file_attachment_comments reviews_review_file_attachment_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments
    ADD CONSTRAINT reviews_review_file_attachment_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_general_comments reviews_review_general_c_review_id_generalcomment_92ad2601_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments
    ADD CONSTRAINT reviews_review_general_c_review_id_generalcomment_92ad2601_uniq UNIQUE (review_id, generalcomment_id);


--
-- Name: reviews_review_general_comments reviews_review_general_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments
    ADD CONSTRAINT reviews_review_general_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_review reviews_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_pkey PRIMARY KEY (id);


--
-- Name: reviews_review_screenshot_comments reviews_review_screensho_review_id_screenshotcomm_d40817af_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments
    ADD CONSTRAINT reviews_review_screensho_review_id_screenshotcomm_d40817af_uniq UNIQUE (review_id, screenshotcomment_id);


--
-- Name: reviews_review_screenshot_comments reviews_review_screenshot_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments
    ADD CONSTRAINT reviews_review_screenshot_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_changedescs reviews_reviewrequest_ch_reviewrequest_id_changed_a0489fdf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs
    ADD CONSTRAINT reviews_reviewrequest_ch_reviewrequest_id_changed_a0489fdf_uniq UNIQUE (reviewrequest_id, changedescription_id);


--
-- Name: reviews_reviewrequest_changedescs reviews_reviewrequest_changedescs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs
    ADD CONSTRAINT reviews_reviewrequest_changedescs_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest reviews_reviewrequest_changenum_repository_id_4aa9bc58_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_changenum_repository_id_4aa9bc58_uniq UNIQUE (changenum, repository_id);


--
-- Name: reviews_reviewrequest reviews_reviewrequest_commit_id_repository_id_8d48574b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_commit_id_repository_id_8d48574b_uniq UNIQUE (commit_id, repository_id);


--
-- Name: reviews_reviewrequest_depends_on reviews_reviewrequest_de_from_reviewrequest_id_to_94e62655_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on
    ADD CONSTRAINT reviews_reviewrequest_de_from_reviewrequest_id_to_94e62655_uniq UNIQUE (from_reviewrequest_id, to_reviewrequest_id);


--
-- Name: reviews_reviewrequest_depends_on reviews_reviewrequest_depends_on_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on
    ADD CONSTRAINT reviews_reviewrequest_depends_on_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_file_attachment_histories reviews_reviewrequest_fi_reviewrequest_id_fileatt_bffdaf41_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories
    ADD CONSTRAINT reviews_reviewrequest_fi_reviewrequest_id_fileatt_bffdaf41_uniq UNIQUE (reviewrequest_id, fileattachmenthistory_id);


--
-- Name: reviews_reviewrequest_file_attachments reviews_reviewrequest_fi_reviewrequest_id_fileatt_ccfa96ca_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_fi_reviewrequest_id_fileatt_ccfa96ca_uniq UNIQUE (reviewrequest_id, fileattachment_id);


--
-- Name: reviews_reviewrequest_file_attachment_histories reviews_reviewrequest_file_attachment_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories
    ADD CONSTRAINT reviews_reviewrequest_file_attachment_histories_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_file_attachments reviews_reviewrequest_file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_file_attachments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_inactive_file_attachments reviews_reviewrequest_in_reviewrequest_id_fileatt_02402ce1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_in_reviewrequest_id_fileatt_02402ce1_uniq UNIQUE (reviewrequest_id, fileattachment_id);


--
-- Name: reviews_reviewrequest_inactive_screenshots reviews_reviewrequest_in_reviewrequest_id_screens_8be75eda_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequest_in_reviewrequest_id_screens_8be75eda_uniq UNIQUE (reviewrequest_id, screenshot_id);


--
-- Name: reviews_reviewrequest_inactive_file_attachments reviews_reviewrequest_inactive_file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequest_inactive_file_attachments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_inactive_screenshots reviews_reviewrequest_inactive_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequest_inactive_screenshots_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest reviews_reviewrequest_local_site_id_local_id_8ee6145b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_local_site_id_local_id_8ee6145b_uniq UNIQUE (local_site_id, local_id);


--
-- Name: reviews_reviewrequest reviews_reviewrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_screenshots reviews_reviewrequest_sc_reviewrequest_id_screens_07732dbc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots
    ADD CONSTRAINT reviews_reviewrequest_sc_reviewrequest_id_screens_07732dbc_uniq UNIQUE (reviewrequest_id, screenshot_id);


--
-- Name: reviews_reviewrequest_screenshots reviews_reviewrequest_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots
    ADD CONSTRAINT reviews_reviewrequest_screenshots_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_target_groups reviews_reviewrequest_ta_reviewrequest_id_group_i_1a8ec82c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups
    ADD CONSTRAINT reviews_reviewrequest_ta_reviewrequest_id_group_i_1a8ec82c_uniq UNIQUE (reviewrequest_id, group_id);


--
-- Name: reviews_reviewrequest_target_people reviews_reviewrequest_ta_reviewrequest_id_user_id_d7cb96bf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people
    ADD CONSTRAINT reviews_reviewrequest_ta_reviewrequest_id_user_id_d7cb96bf_uniq UNIQUE (reviewrequest_id, user_id);


--
-- Name: reviews_reviewrequest_target_groups reviews_reviewrequest_target_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups
    ADD CONSTRAINT reviews_reviewrequest_target_groups_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequest_target_people reviews_reviewrequest_target_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people
    ADD CONSTRAINT reviews_reviewrequest_target_people_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments reviews_reviewrequestdra_reviewrequestdraft_id_fi_0392ef46_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdra_reviewrequestdraft_id_fi_0392ef46_uniq UNIQUE (reviewrequestdraft_id, fileattachment_id);


--
-- Name: reviews_reviewrequestdraft_file_attachments reviews_reviewrequestdra_reviewrequestdraft_id_fi_d78bc93a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdra_reviewrequestdraft_id_fi_d78bc93a_uniq UNIQUE (reviewrequestdraft_id, fileattachment_id);


--
-- Name: reviews_reviewrequestdraft_target_groups reviews_reviewrequestdra_reviewrequestdraft_id_gr_780014ae_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups
    ADD CONSTRAINT reviews_reviewrequestdra_reviewrequestdraft_id_gr_780014ae_uniq UNIQUE (reviewrequestdraft_id, group_id);


--
-- Name: reviews_reviewrequestdraft_depends_on reviews_reviewrequestdra_reviewrequestdraft_id_re_8fc5961d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on
    ADD CONSTRAINT reviews_reviewrequestdra_reviewrequestdraft_id_re_8fc5961d_uniq UNIQUE (reviewrequestdraft_id, reviewrequest_id);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots reviews_reviewrequestdra_reviewrequestdraft_id_sc_322d1203_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequestdra_reviewrequestdraft_id_sc_322d1203_uniq UNIQUE (reviewrequestdraft_id, screenshot_id);


--
-- Name: reviews_reviewrequestdraft_screenshots reviews_reviewrequestdra_reviewrequestdraft_id_sc_71233108_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots
    ADD CONSTRAINT reviews_reviewrequestdra_reviewrequestdraft_id_sc_71233108_uniq UNIQUE (reviewrequestdraft_id, screenshot_id);


--
-- Name: reviews_reviewrequestdraft_target_people reviews_reviewrequestdra_reviewrequestdraft_id_us_2d4e7918_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people
    ADD CONSTRAINT reviews_reviewrequestdra_reviewrequestdraft_id_us_2d4e7918_uniq UNIQUE (reviewrequestdraft_id, user_id);


--
-- Name: reviews_reviewrequestdraft_depends_on reviews_reviewrequestdraft_depends_on_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on
    ADD CONSTRAINT reviews_reviewrequestdraft_depends_on_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_file_attachments reviews_reviewrequestdraft_file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdraft_file_attachments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments reviews_reviewrequestdraft_inactive_file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewrequestdraft_inactive_file_attachments_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots reviews_reviewrequestdraft_inactive_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots
    ADD CONSTRAINT reviews_reviewrequestdraft_inactive_screenshots_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_review_request_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_review_request_id_key UNIQUE (review_request_id);


--
-- Name: reviews_reviewrequestdraft_screenshots reviews_reviewrequestdraft_screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots
    ADD CONSTRAINT reviews_reviewrequestdraft_screenshots_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_target_groups reviews_reviewrequestdraft_target_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups
    ADD CONSTRAINT reviews_reviewrequestdraft_target_groups_pkey PRIMARY KEY (id);


--
-- Name: reviews_reviewrequestdraft_target_people reviews_reviewrequestdraft_target_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people
    ADD CONSTRAINT reviews_reviewrequestdraft_target_people_pkey PRIMARY KEY (id);


--
-- Name: reviews_screenshot reviews_screenshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshot
    ADD CONSTRAINT reviews_screenshot_pkey PRIMARY KEY (id);


--
-- Name: reviews_screenshotcomment reviews_screenshotcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshotcomment
    ADD CONSTRAINT reviews_screenshotcomment_pkey PRIMARY KEY (id);


--
-- Name: reviews_statusupdate reviews_statusupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_pkey PRIMARY KEY (id);


--
-- Name: reviews_statusupdate reviews_statusupdate_review_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_review_id_key UNIQUE (review_id);


--
-- Name: scmtools_repository scmtools_repository_archived_timestamp_path__cac61803_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_archived_timestamp_path__cac61803_uniq UNIQUE (archived_timestamp, path, local_site_id);


--
-- Name: scmtools_repository scmtools_repository_hooks_uuid_local_site_id_05a64b12_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_hooks_uuid_local_site_id_05a64b12_uniq UNIQUE (hooks_uuid, local_site_id);


--
-- Name: scmtools_repository scmtools_repository_name_local_site_id_17cf0ace_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_name_local_site_id_17cf0ace_uniq UNIQUE (name, local_site_id);


--
-- Name: scmtools_repository scmtools_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_pkey PRIMARY KEY (id);


--
-- Name: scmtools_repository_review_groups scmtools_repository_revi_repository_id_group_id_1e0382de_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups
    ADD CONSTRAINT scmtools_repository_revi_repository_id_group_id_1e0382de_uniq UNIQUE (repository_id, group_id);


--
-- Name: scmtools_repository_review_groups scmtools_repository_review_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups
    ADD CONSTRAINT scmtools_repository_review_groups_pkey PRIMARY KEY (id);


--
-- Name: scmtools_repository_users scmtools_repository_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users
    ADD CONSTRAINT scmtools_repository_users_pkey PRIMARY KEY (id);


--
-- Name: scmtools_repository_users scmtools_repository_users_repository_id_user_id_c239bac4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users
    ADD CONSTRAINT scmtools_repository_users_repository_id_user_id_c239bac4_uniq UNIQUE (repository_id, user_id);


--
-- Name: scmtools_tool scmtools_tool_class_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_tool
    ADD CONSTRAINT scmtools_tool_class_name_key UNIQUE (class_name);


--
-- Name: scmtools_tool scmtools_tool_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_tool
    ADD CONSTRAINT scmtools_tool_name_key UNIQUE (name);


--
-- Name: scmtools_tool scmtools_tool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_tool
    ADD CONSTRAINT scmtools_tool_pkey PRIMARY KEY (id);


--
-- Name: site_localsite_admins site_localsite_admins_localsite_id_user_id_4644c48c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins
    ADD CONSTRAINT site_localsite_admins_localsite_id_user_id_4644c48c_uniq UNIQUE (localsite_id, user_id);


--
-- Name: site_localsite_admins site_localsite_admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins
    ADD CONSTRAINT site_localsite_admins_pkey PRIMARY KEY (id);


--
-- Name: site_localsite site_localsite_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite
    ADD CONSTRAINT site_localsite_name_key UNIQUE (name);


--
-- Name: site_localsite site_localsite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite
    ADD CONSTRAINT site_localsite_pkey PRIMARY KEY (id);


--
-- Name: site_localsite_users site_localsite_users_localsite_id_user_id_2b5aa5f9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users
    ADD CONSTRAINT site_localsite_users_localsite_id_user_id_2b5aa5f9_uniq UNIQUE (localsite_id, user_id);


--
-- Name: site_localsite_users site_localsite_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users
    ADD CONSTRAINT site_localsite_users_pkey PRIMARY KEY (id);


--
-- Name: siteconfig_siteconfiguration siteconfig_siteconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siteconfig_siteconfiguration
    ADD CONSTRAINT siteconfig_siteconfiguration_pkey PRIMARY KEY (id);


--
-- Name: webapi_webapitoken webapi_webapitoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken
    ADD CONSTRAINT webapi_webapitoken_pkey PRIMARY KEY (id);


--
-- Name: webapi_webapitoken webapi_webapitoken_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken
    ADD CONSTRAINT webapi_webapitoken_token_key UNIQUE (token);


--
-- Name: accounts_localsiteprofile_local_site_id_e8e611d3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_localsiteprofile_local_site_id_e8e611d3 ON public.accounts_localsiteprofile USING btree (local_site_id);


--
-- Name: accounts_localsiteprofile_profile_id_6838b6f5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_localsiteprofile_profile_id_6838b6f5 ON public.accounts_localsiteprofile USING btree (profile_id);


--
-- Name: accounts_localsiteprofile_user_id_4faa8400; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_localsiteprofile_user_id_4faa8400 ON public.accounts_localsiteprofile USING btree (user_id);


--
-- Name: accounts_profile_starred_groups_group_id_5cf2c564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_starred_groups_group_id_5cf2c564 ON public.accounts_profile_starred_groups USING btree (group_id);


--
-- Name: accounts_profile_starred_groups_profile_id_f62f8a74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_starred_groups_profile_id_f62f8a74 ON public.accounts_profile_starred_groups USING btree (profile_id);


--
-- Name: accounts_profile_starred_r_reviewrequest_id_be0af917; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_starred_r_reviewrequest_id_be0af917 ON public.accounts_profile_starred_review_requests USING btree (reviewrequest_id);


--
-- Name: accounts_profile_starred_review_requests_profile_id_cf4bb46e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_profile_starred_review_requests_profile_id_cf4bb46e ON public.accounts_profile_starred_review_requests USING btree (profile_id);


--
-- Name: accounts_reviewrequestvisit_review_request_id_3bd58111; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_reviewrequestvisit_review_request_id_3bd58111 ON public.accounts_reviewrequestvisit USING btree (review_request_id);


--
-- Name: accounts_reviewrequestvisit_user_id_8ed30d49; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_reviewrequestvisit_user_id_8ed30d49 ON public.accounts_reviewrequestvisit USING btree (user_id);


--
-- Name: accounts_reviewrequestvisit_user_id_visibility_e9e85630_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_reviewrequestvisit_user_id_visibility_e9e85630_idx ON public.accounts_reviewrequestvisit USING btree (user_id, visibility);


--
-- Name: accounts_trophy_local_site_id_b29042f4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_trophy_local_site_id_b29042f4 ON public.accounts_trophy USING btree (local_site_id);


--
-- Name: accounts_trophy_review_request_id_8d01e0f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_trophy_review_request_id_8d01e0f8 ON public.accounts_trophy USING btree (review_request_id);


--
-- Name: accounts_trophy_user_id_ef0f407a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_trophy_user_id_ef0f407a ON public.accounts_trophy USING btree (user_id);


--
-- Name: attachments_fileattachment_added_in_filediff_id_5bbf0a9b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_added_in_filediff_id_5bbf0a9b ON public.attachments_fileattachment USING btree (added_in_filediff_id);


--
-- Name: attachments_fileattachment_attachment_history_id_79d851af; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_attachment_history_id_79d851af ON public.attachments_fileattachment USING btree (attachment_history_id);


--
-- Name: attachments_fileattachment_local_site_id_be669fcf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_local_site_id_be669fcf ON public.attachments_fileattachment USING btree (local_site_id);


--
-- Name: attachments_fileattachment_repo_revision_0b865a62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_repo_revision_0b865a62 ON public.attachments_fileattachment USING btree (repo_revision);


--
-- Name: attachments_fileattachment_repo_revision_0b865a62_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_repo_revision_0b865a62_like ON public.attachments_fileattachment USING btree (repo_revision varchar_pattern_ops);


--
-- Name: attachments_fileattachment_repository_id_a23f76db; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_repository_id_a23f76db ON public.attachments_fileattachment USING btree (repository_id);


--
-- Name: attachments_fileattachment_user_id_dbe26565; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_fileattachment_user_id_dbe26565 ON public.attachments_fileattachment USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: changedescs_changedescription_user_id_2341d9f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changedescs_changedescription_user_id_2341d9f9 ON public.changedescs_changedescription USING btree (user_id);


--
-- Name: diffviewer_diffcommit_diffset_id_8c3c2dbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffcommit_diffset_id_8c3c2dbb ON public.diffviewer_diffcommit USING btree (diffset_id);


--
-- Name: diffviewer_diffset_base_commit_id_037195a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffset_base_commit_id_037195a9 ON public.diffviewer_diffset USING btree (base_commit_id);


--
-- Name: diffviewer_diffset_base_commit_id_037195a9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffset_base_commit_id_037195a9_like ON public.diffviewer_diffset USING btree (base_commit_id varchar_pattern_ops);


--
-- Name: diffviewer_diffset_history_id_539bce58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffset_history_id_539bce58 ON public.diffviewer_diffset USING btree (history_id);


--
-- Name: diffviewer_diffset_repository_id_bdf3a395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_diffset_repository_id_bdf3a395 ON public.diffviewer_diffset USING btree (repository_id);


--
-- Name: diffviewer_filediff_commit_id_8ba58a4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_commit_id_8ba58a4a ON public.diffviewer_filediff USING btree (commit_id);


--
-- Name: diffviewer_filediff_diff_hash_id_d6cd0509; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_diff_hash_id_d6cd0509 ON public.diffviewer_filediff USING btree (diff_hash_id);


--
-- Name: diffviewer_filediff_diff_hash_id_d6cd0509_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_diff_hash_id_d6cd0509_like ON public.diffviewer_filediff USING btree (diff_hash_id varchar_pattern_ops);


--
-- Name: diffviewer_filediff_diffset_id_f5b24a5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_diffset_id_f5b24a5d ON public.diffviewer_filediff USING btree (diffset_id);


--
-- Name: diffviewer_filediff_parent_diff_hash_id_73defa3d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_parent_diff_hash_id_73defa3d ON public.diffviewer_filediff USING btree (parent_diff_hash_id);


--
-- Name: diffviewer_filediff_parent_diff_hash_id_73defa3d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_parent_diff_hash_id_73defa3d_like ON public.diffviewer_filediff USING btree (parent_diff_hash_id varchar_pattern_ops);


--
-- Name: diffviewer_filediff_raw_diff_hash_id_ce904491; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_raw_diff_hash_id_ce904491 ON public.diffviewer_filediff USING btree (raw_diff_hash_id);


--
-- Name: diffviewer_filediff_raw_parent_diff_hash_id_8bead4b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediff_raw_parent_diff_hash_id_8bead4b4 ON public.diffviewer_filediff USING btree (raw_parent_diff_hash_id);


--
-- Name: diffviewer_filediffdata_binary_hash_1f695c3b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_filediffdata_binary_hash_1f695c3b_like ON public.diffviewer_filediffdata USING btree (binary_hash varchar_pattern_ops);


--
-- Name: diffviewer_rawfilediffdata_binary_hash_63cbb56a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX diffviewer_rawfilediffdata_binary_hash_63cbb56a_like ON public.diffviewer_rawfilediffdata USING btree (binary_hash varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_evolution_version_id_e55942c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_evolution_version_id_e55942c9 ON public.django_evolution USING btree (version_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: djblets_privacy_storedco_audit_identifier_eeb12ed0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djblets_privacy_storedco_audit_identifier_eeb12ed0_like ON public.djblets_privacy_storedconsentdata USING btree (audit_identifier varchar_pattern_ops);


--
-- Name: djblets_privacy_storedconsentdata_audit_identifier_eeb12ed0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djblets_privacy_storedconsentdata_audit_identifier_eeb12ed0 ON public.djblets_privacy_storedconsentdata USING btree (audit_identifier);


--
-- Name: extensions_registeredextension_class_name_e2ae2513_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX extensions_registeredextension_class_name_e2ae2513_like ON public.extensions_registeredextension USING btree (class_name varchar_pattern_ops);


--
-- Name: hostingsvcs_hostingserviceaccount_local_site_id_6688df40; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hostingsvcs_hostingserviceaccount_local_site_id_6688df40 ON public.hostingsvcs_hostingserviceaccount USING btree (local_site_id);


--
-- Name: integrations_integrationconfig_enabled_b7f7e2fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX integrations_integrationconfig_enabled_b7f7e2fc ON public.integrations_integrationconfig USING btree (enabled);


--
-- Name: integrations_integrationconfig_integration_id_c90e0bae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX integrations_integrationconfig_integration_id_c90e0bae ON public.integrations_integrationconfig USING btree (integration_id);


--
-- Name: integrations_integrationconfig_integration_id_c90e0bae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX integrations_integrationconfig_integration_id_c90e0bae_like ON public.integrations_integrationconfig USING btree (integration_id varchar_pattern_ops);


--
-- Name: integrations_integrationconfig_local_site_id_d6913121; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX integrations_integrationconfig_local_site_id_d6913121 ON public.integrations_integrationconfig USING btree (local_site_id);


--
-- Name: notifications_webhooktarge_webhooktarget_id_1f60c953; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_webhooktarge_webhooktarget_id_1f60c953 ON public.notifications_webhooktarget_repositories USING btree (webhooktarget_id);


--
-- Name: notifications_webhooktarget_local_site_id_1ec00cea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_webhooktarget_local_site_id_1ec00cea ON public.notifications_webhooktarget USING btree (local_site_id);


--
-- Name: notifications_webhooktarget_repositories_repository_id_703af70a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_webhooktarget_repositories_repository_id_703af70a ON public.notifications_webhooktarget_repositories USING btree (repository_id);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8 ON public.oauth2_provider_accesstoken USING btree (token);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf ON public.oauth2_provider_grant USING btree (code);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_token_d090daa4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4 ON public.oauth2_provider_refreshtoken USING btree (token);


--
-- Name: oauth2_provider_refreshtoken_token_d090daa4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4_like ON public.oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: reviewboard_oauth_application_client_id_aa8769c4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_client_id_aa8769c4_like ON public.reviewboard_oauth_application USING btree (client_id varchar_pattern_ops);


--
-- Name: reviewboard_oauth_application_client_secret_4de4461a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_client_secret_4de4461a ON public.reviewboard_oauth_application USING btree (client_secret);


--
-- Name: reviewboard_oauth_application_client_secret_4de4461a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_client_secret_4de4461a_like ON public.reviewboard_oauth_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: reviewboard_oauth_application_local_site_id_412bed6e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_local_site_id_412bed6e ON public.reviewboard_oauth_application USING btree (local_site_id);


--
-- Name: reviewboard_oauth_application_original_user_id_7df83187; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_original_user_id_7df83187 ON public.reviewboard_oauth_application USING btree (original_user_id);


--
-- Name: reviewboard_oauth_application_user_id_5306421b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviewboard_oauth_application_user_id_5306421b ON public.reviewboard_oauth_application USING btree (user_id);


--
-- Name: reviews_comment_filediff_id_95cdd174; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_filediff_id_95cdd174 ON public.reviews_comment USING btree (filediff_id);


--
-- Name: reviews_comment_interfilediff_id_fb77b53c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_interfilediff_id_fb77b53c ON public.reviews_comment USING btree (interfilediff_id);


--
-- Name: reviews_comment_issue_status_af21c71b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_issue_status_af21c71b ON public.reviews_comment USING btree (issue_status);


--
-- Name: reviews_comment_issue_status_af21c71b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_issue_status_af21c71b_like ON public.reviews_comment USING btree (issue_status varchar_pattern_ops);


--
-- Name: reviews_comment_reply_to_id_a7b3749b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_reply_to_id_a7b3749b ON public.reviews_comment USING btree (reply_to_id);


--
-- Name: reviews_defaultreviewer_groups_defaultreviewer_id_e89ca162; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_groups_defaultreviewer_id_e89ca162 ON public.reviews_defaultreviewer_groups USING btree (defaultreviewer_id);


--
-- Name: reviews_defaultreviewer_groups_group_id_8f130dec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_groups_group_id_8f130dec ON public.reviews_defaultreviewer_groups USING btree (group_id);


--
-- Name: reviews_defaultreviewer_local_site_id_bcfc837d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_local_site_id_bcfc837d ON public.reviews_defaultreviewer USING btree (local_site_id);


--
-- Name: reviews_defaultreviewer_people_defaultreviewer_id_3b5a7031; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_people_defaultreviewer_id_3b5a7031 ON public.reviews_defaultreviewer_people USING btree (defaultreviewer_id);


--
-- Name: reviews_defaultreviewer_people_user_id_0871feb0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_people_user_id_0871feb0 ON public.reviews_defaultreviewer_people USING btree (user_id);


--
-- Name: reviews_defaultreviewer_repository_defaultreviewer_id_6876ab14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_repository_defaultreviewer_id_6876ab14 ON public.reviews_defaultreviewer_repository USING btree (defaultreviewer_id);


--
-- Name: reviews_defaultreviewer_repository_repository_id_7f3f56b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_defaultreviewer_repository_repository_id_7f3f56b6 ON public.reviews_defaultreviewer_repository USING btree (repository_id);


--
-- Name: reviews_fileattachmentcomm_diff_against_file_attachme_8a13f559; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomm_diff_against_file_attachme_8a13f559 ON public.reviews_fileattachmentcomment USING btree (diff_against_file_attachment_id);


--
-- Name: reviews_fileattachmentcomment_file_attachment_id_8db79ee7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_file_attachment_id_8db79ee7 ON public.reviews_fileattachmentcomment USING btree (file_attachment_id);


--
-- Name: reviews_fileattachmentcomment_issue_status_775b5a50; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_issue_status_775b5a50 ON public.reviews_fileattachmentcomment USING btree (issue_status);


--
-- Name: reviews_fileattachmentcomment_issue_status_775b5a50_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_issue_status_775b5a50_like ON public.reviews_fileattachmentcomment USING btree (issue_status varchar_pattern_ops);


--
-- Name: reviews_fileattachmentcomment_reply_to_id_17c9efca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_fileattachmentcomment_reply_to_id_17c9efca ON public.reviews_fileattachmentcomment USING btree (reply_to_id);


--
-- Name: reviews_generalcomment_issue_status_4b49c612; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_generalcomment_issue_status_4b49c612 ON public.reviews_generalcomment USING btree (issue_status);


--
-- Name: reviews_generalcomment_issue_status_4b49c612_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_generalcomment_issue_status_4b49c612_like ON public.reviews_generalcomment USING btree (issue_status varchar_pattern_ops);


--
-- Name: reviews_generalcomment_reply_to_id_d0a69bbf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_generalcomment_reply_to_id_d0a69bbf ON public.reviews_generalcomment USING btree (reply_to_id);


--
-- Name: reviews_group_local_site_id_b7e35237; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_local_site_id_b7e35237 ON public.reviews_group USING btree (local_site_id);


--
-- Name: reviews_group_name_c92d67b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_name_c92d67b9 ON public.reviews_group USING btree (name);


--
-- Name: reviews_group_name_c92d67b9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_name_c92d67b9_like ON public.reviews_group USING btree (name varchar_pattern_ops);


--
-- Name: reviews_group_users_group_id_3bb40386; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_users_group_id_3bb40386 ON public.reviews_group_users USING btree (group_id);


--
-- Name: reviews_group_users_user_id_5403120e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_group_users_user_id_5403120e ON public.reviews_group_users USING btree (user_id);


--
-- Name: reviews_review_base_reply_to_id_a208ad8a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_base_reply_to_id_a208ad8a ON public.reviews_review USING btree (base_reply_to_id);


--
-- Name: reviews_review_body_bottom_reply_to_id_a0c60294; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_body_bottom_reply_to_id_a0c60294 ON public.reviews_review USING btree (body_bottom_reply_to_id);


--
-- Name: reviews_review_body_top_reply_to_id_4f3807c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_body_top_reply_to_id_4f3807c0 ON public.reviews_review USING btree (body_top_reply_to_id);


--
-- Name: reviews_review_comments_comment_id_a1f2afdb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_comments_comment_id_a1f2afdb ON public.reviews_review_comments USING btree (comment_id);


--
-- Name: reviews_review_comments_review_id_0a600993; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_comments_review_id_0a600993 ON public.reviews_review_comments USING btree (review_id);


--
-- Name: reviews_review_file_attach_fileattachmentcomment_id_1dae596b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_file_attach_fileattachmentcomment_id_1dae596b ON public.reviews_review_file_attachment_comments USING btree (fileattachmentcomment_id);


--
-- Name: reviews_review_file_attachment_comments_review_id_f33dcceb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_file_attachment_comments_review_id_f33dcceb ON public.reviews_review_file_attachment_comments USING btree (review_id);


--
-- Name: reviews_review_general_comments_generalcomment_id_08380dc1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_general_comments_generalcomment_id_08380dc1 ON public.reviews_review_general_comments USING btree (generalcomment_id);


--
-- Name: reviews_review_general_comments_review_id_b2db3c78; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_general_comments_review_id_b2db3c78 ON public.reviews_review_general_comments USING btree (review_id);


--
-- Name: reviews_review_review_request_id_be762bb2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_review_request_id_be762bb2 ON public.reviews_review USING btree (review_request_id);


--
-- Name: reviews_review_reviewed_diffset_id_4b8bdf06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_reviewed_diffset_id_4b8bdf06 ON public.reviews_review USING btree (reviewed_diffset_id);


--
-- Name: reviews_review_screenshot__screenshotcomment_id_c90580b3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_screenshot__screenshotcomment_id_c90580b3 ON public.reviews_review_screenshot_comments USING btree (screenshotcomment_id);


--
-- Name: reviews_review_screenshot_comments_review_id_1210ef03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_screenshot_comments_review_id_1210ef03 ON public.reviews_review_screenshot_comments USING btree (review_id);


--
-- Name: reviews_review_user_id_875caff2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_user_id_875caff2 ON public.reviews_review USING btree (user_id);


--
-- Name: reviews_reviewrequest_changedescs_changedescription_id_c25c1fe7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_changedescs_changedescription_id_c25c1fe7 ON public.reviews_reviewrequest_changedescs USING btree (changedescription_id);


--
-- Name: reviews_reviewrequest_changedescs_reviewrequest_id_65def65a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_changedescs_reviewrequest_id_65def65a ON public.reviews_reviewrequest_changedescs USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_changenum_a119b782; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_changenum_a119b782 ON public.reviews_reviewrequest USING btree (changenum);


--
-- Name: reviews_reviewrequest_commit_id_e7104524; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_commit_id_e7104524 ON public.reviews_reviewrequest USING btree (commit_id);


--
-- Name: reviews_reviewrequest_commit_id_e7104524_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_commit_id_e7104524_like ON public.reviews_reviewrequest USING btree (commit_id varchar_pattern_ops);


--
-- Name: reviews_reviewrequest_depends_on_from_reviewrequest_id_2d1eab85; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_depends_on_from_reviewrequest_id_2d1eab85 ON public.reviews_reviewrequest_depends_on USING btree (from_reviewrequest_id);


--
-- Name: reviews_reviewrequest_depends_on_to_reviewrequest_id_ab47bf47; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_depends_on_to_reviewrequest_id_ab47bf47 ON public.reviews_reviewrequest_depends_on USING btree (to_reviewrequest_id);


--
-- Name: reviews_reviewrequest_diffset_history_id_803728bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_diffset_history_id_803728bf ON public.reviews_reviewrequest USING btree (diffset_history_id);


--
-- Name: reviews_reviewrequest_file_fileattachment_id_e78e0b5e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_file_fileattachment_id_e78e0b5e ON public.reviews_reviewrequest_file_attachments USING btree (fileattachment_id);


--
-- Name: reviews_reviewrequest_file_fileattachmenthistory_id_78c33186; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_file_fileattachmenthistory_id_78c33186 ON public.reviews_reviewrequest_file_attachment_histories USING btree (fileattachmenthistory_id);


--
-- Name: reviews_reviewrequest_file_reviewrequest_id_3bf5d0d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_file_reviewrequest_id_3bf5d0d8 ON public.reviews_reviewrequest_file_attachments USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_file_reviewrequest_id_84509ea0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_file_reviewrequest_id_84509ea0 ON public.reviews_reviewrequest_file_attachment_histories USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_inac_fileattachment_id_c63ab996; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_inac_fileattachment_id_c63ab996 ON public.reviews_reviewrequest_inactive_file_attachments USING btree (fileattachment_id);


--
-- Name: reviews_reviewrequest_inac_reviewrequest_id_192a5b09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_inac_reviewrequest_id_192a5b09 ON public.reviews_reviewrequest_inactive_screenshots USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_inac_reviewrequest_id_649d41ec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_inac_reviewrequest_id_649d41ec ON public.reviews_reviewrequest_inactive_file_attachments USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_inac_screenshot_id_26fa56c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_inac_screenshot_id_26fa56c2 ON public.reviews_reviewrequest_inactive_screenshots USING btree (screenshot_id);


--
-- Name: reviews_reviewrequest_local_site_id_7eadf98c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_local_site_id_7eadf98c ON public.reviews_reviewrequest USING btree (local_site_id);


--
-- Name: reviews_reviewrequest_repository_id_a411142d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_repository_id_a411142d ON public.reviews_reviewrequest USING btree (repository_id);


--
-- Name: reviews_reviewrequest_screenshots_reviewrequest_id_67148a80; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_screenshots_reviewrequest_id_67148a80 ON public.reviews_reviewrequest_screenshots USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_screenshots_screenshot_id_a3499d76; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_screenshots_screenshot_id_a3499d76 ON public.reviews_reviewrequest_screenshots USING btree (screenshot_id);


--
-- Name: reviews_reviewrequest_status_63d3e3fd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_status_63d3e3fd ON public.reviews_reviewrequest USING btree (status);


--
-- Name: reviews_reviewrequest_status_63d3e3fd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_status_63d3e3fd_like ON public.reviews_reviewrequest USING btree (status varchar_pattern_ops);


--
-- Name: reviews_reviewrequest_submitter_id_0a5fadde; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_submitter_id_0a5fadde ON public.reviews_reviewrequest USING btree (submitter_id);


--
-- Name: reviews_reviewrequest_summary; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_summary ON public.reviews_reviewrequest USING btree (summary);


--
-- Name: reviews_reviewrequest_target_groups_group_id_c197c2b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_target_groups_group_id_c197c2b6 ON public.reviews_reviewrequest_target_groups USING btree (group_id);


--
-- Name: reviews_reviewrequest_target_groups_reviewrequest_id_9f397bce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_target_groups_reviewrequest_id_9f397bce ON public.reviews_reviewrequest_target_groups USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_target_people_reviewrequest_id_5b9a960c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_target_people_reviewrequest_id_5b9a960c ON public.reviews_reviewrequest_target_people USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequest_target_people_user_id_1120a3d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequest_target_people_user_id_1120a3d1 ON public.reviews_reviewrequest_target_people USING btree (user_id);


--
-- Name: reviews_reviewrequestdraft_changedesc_id_70a4d612; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_changedesc_id_70a4d612 ON public.reviews_reviewrequestdraft USING btree (changedesc_id);


--
-- Name: reviews_reviewrequestdraft_commit_id_a36610d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_commit_id_a36610d9 ON public.reviews_reviewrequestdraft USING btree (commit_id);


--
-- Name: reviews_reviewrequestdraft_commit_id_a36610d9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_commit_id_a36610d9_like ON public.reviews_reviewrequestdraft USING btree (commit_id varchar_pattern_ops);


--
-- Name: reviews_reviewrequestdraft_depends_on_reviewrequest_id_834a2c3f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_depends_on_reviewrequest_id_834a2c3f ON public.reviews_reviewrequestdraft_depends_on USING btree (reviewrequest_id);


--
-- Name: reviews_reviewrequestdraft_diffset_id_ba3c2e37; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_diffset_id_ba3c2e37 ON public.reviews_reviewrequestdraft USING btree (diffset_id);


--
-- Name: reviews_reviewrequestdraft_fileattachment_id_70274302; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_fileattachment_id_70274302 ON public.reviews_reviewrequestdraft_file_attachments USING btree (fileattachment_id);


--
-- Name: reviews_reviewrequestdraft_fileattachment_id_fa327aa0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_fileattachment_id_fa327aa0 ON public.reviews_reviewrequestdraft_inactive_file_attachments USING btree (fileattachment_id);


--
-- Name: reviews_reviewrequestdraft_owner_id_86066878; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_owner_id_86066878 ON public.reviews_reviewrequestdraft USING btree (owner_id);


--
-- Name: reviews_reviewrequestdraft_reviewrequestdraft_id_29694abc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_reviewrequestdraft_id_29694abc ON public.reviews_reviewrequestdraft_inactive_file_attachments USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_reviewrequestdraft_id_550d105a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_reviewrequestdraft_id_550d105a ON public.reviews_reviewrequestdraft_depends_on USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_reviewrequestdraft_id_6ca73ce6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_reviewrequestdraft_id_6ca73ce6 ON public.reviews_reviewrequestdraft_file_attachments USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_reviewrequestdraft_id_a8339e18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_reviewrequestdraft_id_a8339e18 ON public.reviews_reviewrequestdraft_inactive_screenshots USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_reviewrequestdraft_id_bd7c450d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_reviewrequestdraft_id_bd7c450d ON public.reviews_reviewrequestdraft_screenshots USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_reviewrequestdraft_id_cf9235c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_reviewrequestdraft_id_cf9235c2 ON public.reviews_reviewrequestdraft_target_people USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_reviewrequestdraft_id_efd7dd03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_reviewrequestdraft_id_efd7dd03 ON public.reviews_reviewrequestdraft_target_groups USING btree (reviewrequestdraft_id);


--
-- Name: reviews_reviewrequestdraft_screenshot_id_ed06dfad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_screenshot_id_ed06dfad ON public.reviews_reviewrequestdraft_inactive_screenshots USING btree (screenshot_id);


--
-- Name: reviews_reviewrequestdraft_screenshots_screenshot_id_68b0d9e3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_screenshots_screenshot_id_68b0d9e3 ON public.reviews_reviewrequestdraft_screenshots USING btree (screenshot_id);


--
-- Name: reviews_reviewrequestdraft_target_groups_group_id_f394ff20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_target_groups_group_id_f394ff20 ON public.reviews_reviewrequestdraft_target_groups USING btree (group_id);


--
-- Name: reviews_reviewrequestdraft_target_people_user_id_83de070a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_reviewrequestdraft_target_people_user_id_83de070a ON public.reviews_reviewrequestdraft_target_people USING btree (user_id);


--
-- Name: reviews_screenshotcomment_issue_status_818e13d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_screenshotcomment_issue_status_818e13d1 ON public.reviews_screenshotcomment USING btree (issue_status);


--
-- Name: reviews_screenshotcomment_issue_status_818e13d1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_screenshotcomment_issue_status_818e13d1_like ON public.reviews_screenshotcomment USING btree (issue_status varchar_pattern_ops);


--
-- Name: reviews_screenshotcomment_reply_to_id_20d83c7c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_screenshotcomment_reply_to_id_20d83c7c ON public.reviews_screenshotcomment USING btree (reply_to_id);


--
-- Name: reviews_screenshotcomment_screenshot_id_0a8f6ad7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_screenshotcomment_screenshot_id_0a8f6ad7 ON public.reviews_screenshotcomment USING btree (screenshot_id);


--
-- Name: reviews_statusupdate_change_description_id_260b3553; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_statusupdate_change_description_id_260b3553 ON public.reviews_statusupdate USING btree (change_description_id);


--
-- Name: reviews_statusupdate_review_request_id_09b3d2bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_statusupdate_review_request_id_09b3d2bf ON public.reviews_statusupdate USING btree (review_request_id);


--
-- Name: reviews_statusupdate_user_id_1f850855; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_statusupdate_user_id_1f850855 ON public.reviews_statusupdate USING btree (user_id);


--
-- Name: scmtools_repository_hosting_account_id_fe34c221; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_hosting_account_id_fe34c221 ON public.scmtools_repository USING btree (hosting_account_id);


--
-- Name: scmtools_repository_local_site_id_989f4f3a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_local_site_id_989f4f3a ON public.scmtools_repository USING btree (local_site_id);


--
-- Name: scmtools_repository_review_groups_group_id_23e39d23; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_review_groups_group_id_23e39d23 ON public.scmtools_repository_review_groups USING btree (group_id);


--
-- Name: scmtools_repository_review_groups_repository_id_23a2ea36; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_review_groups_repository_id_23a2ea36 ON public.scmtools_repository_review_groups USING btree (repository_id);


--
-- Name: scmtools_repository_tool_id_d3b242d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_tool_id_d3b242d1 ON public.scmtools_repository USING btree (tool_id);


--
-- Name: scmtools_repository_users_repository_id_d8c11b09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_users_repository_id_d8c11b09 ON public.scmtools_repository_users USING btree (repository_id);


--
-- Name: scmtools_repository_users_user_id_fd0f89b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_repository_users_user_id_fd0f89b9 ON public.scmtools_repository_users USING btree (user_id);


--
-- Name: scmtools_tool_class_name_985906e5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_tool_class_name_985906e5_like ON public.scmtools_tool USING btree (class_name varchar_pattern_ops);


--
-- Name: scmtools_tool_name_3f0ba5dd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scmtools_tool_name_3f0ba5dd_like ON public.scmtools_tool USING btree (name varchar_pattern_ops);


--
-- Name: site_localsite_admins_localsite_id_f1ecf08a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_admins_localsite_id_f1ecf08a ON public.site_localsite_admins USING btree (localsite_id);


--
-- Name: site_localsite_admins_user_id_a78f941a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_admins_user_id_a78f941a ON public.site_localsite_admins USING btree (user_id);


--
-- Name: site_localsite_name_3de9d750_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_name_3de9d750_like ON public.site_localsite USING btree (name varchar_pattern_ops);


--
-- Name: site_localsite_users_localsite_id_9f338deb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_users_localsite_id_9f338deb ON public.site_localsite_users USING btree (localsite_id);


--
-- Name: site_localsite_users_user_id_d0c1231a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_localsite_users_user_id_d0c1231a ON public.site_localsite_users USING btree (user_id);


--
-- Name: siteconfig_siteconfiguration_site_id_a352de24; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX siteconfig_siteconfiguration_site_id_a352de24 ON public.siteconfig_siteconfiguration USING btree (site_id);


--
-- Name: webapi_webapitoken_local_site_id_72c83924; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapi_webapitoken_local_site_id_72c83924 ON public.webapi_webapitoken USING btree (local_site_id);


--
-- Name: webapi_webapitoken_token_9770ba5a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapi_webapitoken_token_9770ba5a_like ON public.webapi_webapitoken USING btree (token varchar_pattern_ops);


--
-- Name: webapi_webapitoken_user_id_3651ab64; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapi_webapitoken_user_id_3651ab64 ON public.webapi_webapitoken USING btree (user_id);


--
-- Name: accounts_localsiteprofile accounts_localsitepr_local_site_id_e8e611d3_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsitepr_local_site_id_e8e611d3_fk_site_loca FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_localsiteprofile accounts_localsitepr_profile_id_6838b6f5_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsitepr_profile_id_6838b6f5_fk_accounts_ FOREIGN KEY (profile_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_localsiteprofile accounts_localsiteprofile_user_id_4faa8400_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_localsiteprofile
    ADD CONSTRAINT accounts_localsiteprofile_user_id_4faa8400_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile_starred_groups accounts_profile_sta_group_id_5cf2c564_fk_reviews_g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups
    ADD CONSTRAINT accounts_profile_sta_group_id_5cf2c564_fk_reviews_g FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile_starred_review_requests accounts_profile_sta_profile_id_cf4bb46e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests
    ADD CONSTRAINT accounts_profile_sta_profile_id_cf4bb46e_fk_accounts_ FOREIGN KEY (profile_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile_starred_groups accounts_profile_sta_profile_id_f62f8a74_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_groups
    ADD CONSTRAINT accounts_profile_sta_profile_id_f62f8a74_fk_accounts_ FOREIGN KEY (profile_id) REFERENCES public.accounts_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile_starred_review_requests accounts_profile_sta_reviewrequest_id_be0af917_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile_starred_review_requests
    ADD CONSTRAINT accounts_profile_sta_reviewrequest_id_be0af917_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile accounts_profile_user_id_49a85d32_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_reviewrequestvisit accounts_reviewreque_review_request_id_3bd58111_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit
    ADD CONSTRAINT accounts_reviewreque_review_request_id_3bd58111_fk_reviews_r FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_reviewrequestvisit accounts_reviewrequestvisit_user_id_8ed30d49_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reviewrequestvisit
    ADD CONSTRAINT accounts_reviewrequestvisit_user_id_8ed30d49_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_trophy accounts_trophy_local_site_id_b29042f4_fk_site_localsite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy
    ADD CONSTRAINT accounts_trophy_local_site_id_b29042f4_fk_site_localsite_id FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_trophy accounts_trophy_review_request_id_8d01e0f8_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy
    ADD CONSTRAINT accounts_trophy_review_request_id_8d01e0f8_fk_reviews_r FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_trophy accounts_trophy_user_id_ef0f407a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_trophy
    ADD CONSTRAINT accounts_trophy_user_id_ef0f407a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment attachments_fileatta_added_in_filediff_id_5bbf0a9b_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileatta_added_in_filediff_id_5bbf0a9b_fk_diffviewe FOREIGN KEY (added_in_filediff_id) REFERENCES public.diffviewer_filediff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment attachments_fileatta_attachment_history_i_79d851af_fk_attachmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileatta_attachment_history_i_79d851af_fk_attachmen FOREIGN KEY (attachment_history_id) REFERENCES public.attachments_fileattachmenthistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment attachments_fileatta_local_site_id_be669fcf_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileatta_local_site_id_be669fcf_fk_site_loca FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment attachments_fileatta_repository_id_a23f76db_fk_scmtools_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileatta_repository_id_a23f76db_fk_scmtools_ FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attachments_fileattachment attachments_fileattachment_user_id_dbe26565_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments_fileattachment
    ADD CONSTRAINT attachments_fileattachment_user_id_dbe26565_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: changedescs_changedescription changedescs_changedescription_user_id_2341d9f9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changedescs_changedescription
    ADD CONSTRAINT changedescs_changedescription_user_id_2341d9f9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_diffcommit diffviewer_diffcommi_diffset_id_8c3c2dbb_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffcommit
    ADD CONSTRAINT diffviewer_diffcommi_diffset_id_8c3c2dbb_fk_diffviewe FOREIGN KEY (diffset_id) REFERENCES public.diffviewer_diffset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_diffset diffviewer_diffset_history_id_539bce58_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffset
    ADD CONSTRAINT diffviewer_diffset_history_id_539bce58_fk_diffviewe FOREIGN KEY (history_id) REFERENCES public.diffviewer_diffsethistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_diffset diffviewer_diffset_repository_id_bdf3a395_fk_scmtools_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_diffset
    ADD CONSTRAINT diffviewer_diffset_repository_id_bdf3a395_fk_scmtools_ FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_commit_id_8ba58a4a_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_commit_id_8ba58a4a_fk_diffviewe FOREIGN KEY (commit_id) REFERENCES public.diffviewer_diffcommit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_diff_hash_id_d6cd0509_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_diff_hash_id_d6cd0509_fk_diffviewe FOREIGN KEY (diff_hash_id) REFERENCES public.diffviewer_filediffdata(binary_hash) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_diffset_id_f5b24a5d_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_diffset_id_f5b24a5d_fk_diffviewe FOREIGN KEY (diffset_id) REFERENCES public.diffviewer_diffset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_parent_diff_hash_id_73defa3d_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_parent_diff_hash_id_73defa3d_fk_diffviewe FOREIGN KEY (parent_diff_hash_id) REFERENCES public.diffviewer_filediffdata(binary_hash) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_raw_diff_hash_id_ce904491_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_raw_diff_hash_id_ce904491_fk_diffviewe FOREIGN KEY (raw_diff_hash_id) REFERENCES public.diffviewer_rawfilediffdata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diffviewer_filediff diffviewer_filediff_raw_parent_diff_hash_8bead4b4_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diffviewer_filediff
    ADD CONSTRAINT diffviewer_filediff_raw_parent_diff_hash_8bead4b4_fk_diffviewe FOREIGN KEY (raw_parent_diff_hash_id) REFERENCES public.diffviewer_rawfilediffdata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_evolution django_evolution_version_id_e55942c9_fk_django_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_evolution
    ADD CONSTRAINT django_evolution_version_id_e55942c9_fk_django_pr FOREIGN KEY (version_id) REFERENCES public.django_project_version(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djblets_privacy_storedconsentdata djblets_privacy_stor_user_id_e703bd23_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djblets_privacy_storedconsentdata
    ADD CONSTRAINT djblets_privacy_stor_user_id_e703bd23_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hostingsvcs_hostingserviceaccount hostingsvcs_hostings_local_site_id_6688df40_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostingsvcs_hostingserviceaccount
    ADD CONSTRAINT hostingsvcs_hostings_local_site_id_6688df40_fk_site_loca FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: integrations_integrationconfig integrations_integra_local_site_id_d6913121_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_integrationconfig
    ADD CONSTRAINT integrations_integra_local_site_id_d6913121_fk_site_loca FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_webhooktarget notifications_webhoo_local_site_id_1ec00cea_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget
    ADD CONSTRAINT notifications_webhoo_local_site_id_1ec00cea_fk_site_loca FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_webhooktarget_repositories notifications_webhoo_repository_id_703af70a_fk_scmtools_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories
    ADD CONSTRAINT notifications_webhoo_repository_id_703af70a_fk_scmtools_ FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_webhooktarget_repositories notifications_webhoo_webhooktarget_id_1f60c953_fk_notificat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_webhooktarget_repositories
    ADD CONSTRAINT notifications_webhoo_webhooktarget_id_1f60c953_fk_notificat FOREIGN KEY (webhooktarget_id) REFERENCES public.notifications_webhooktarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_application_id_b22886e1_fk_reviewboa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_application_id_b22886e1_fk_reviewboa FOREIGN KEY (application_id) REFERENCES public.reviewboard_oauth_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_gran_application_id_81923564_fk_reviewboa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_gran_application_id_81923564_fk_reviewboa FOREIGN KEY (application_id) REFERENCES public.reviewboard_oauth_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_application_id_2d1c311b_fk_reviewboa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_application_id_2d1c311b_fk_reviewboa FOREIGN KEY (application_id) REFERENCES public.reviewboard_oauth_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviewboard_oauth_application reviewboard_oauth_ap_local_site_id_412bed6e_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_ap_local_site_id_412bed6e_fk_site_loca FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviewboard_oauth_application reviewboard_oauth_ap_original_user_id_7df83187_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_ap_original_user_id_7df83187_fk_auth_user FOREIGN KEY (original_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviewboard_oauth_application reviewboard_oauth_application_user_id_5306421b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewboard_oauth_application
    ADD CONSTRAINT reviewboard_oauth_application_user_id_5306421b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_comment reviews_comment_filediff_id_95cdd174_fk_diffviewer_filediff_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_filediff_id_95cdd174_fk_diffviewer_filediff_id FOREIGN KEY (filediff_id) REFERENCES public.diffviewer_filediff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_comment reviews_comment_interfilediff_id_fb77b53c_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_interfilediff_id_fb77b53c_fk_diffviewe FOREIGN KEY (interfilediff_id) REFERENCES public.diffviewer_filediff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_comment reviews_comment_reply_to_id_a7b3749b_fk_reviews_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_reply_to_id_a7b3749b_fk_reviews_comment_id FOREIGN KEY (reply_to_id) REFERENCES public.reviews_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_people reviews_defaultrevie_defaultreviewer_id_3b5a7031_fk_reviews_d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people
    ADD CONSTRAINT reviews_defaultrevie_defaultreviewer_id_3b5a7031_fk_reviews_d FOREIGN KEY (defaultreviewer_id) REFERENCES public.reviews_defaultreviewer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_repository reviews_defaultrevie_defaultreviewer_id_6876ab14_fk_reviews_d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository
    ADD CONSTRAINT reviews_defaultrevie_defaultreviewer_id_6876ab14_fk_reviews_d FOREIGN KEY (defaultreviewer_id) REFERENCES public.reviews_defaultreviewer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_groups reviews_defaultrevie_defaultreviewer_id_e89ca162_fk_reviews_d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups
    ADD CONSTRAINT reviews_defaultrevie_defaultreviewer_id_e89ca162_fk_reviews_d FOREIGN KEY (defaultreviewer_id) REFERENCES public.reviews_defaultreviewer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_groups reviews_defaultrevie_group_id_8f130dec_fk_reviews_g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_groups
    ADD CONSTRAINT reviews_defaultrevie_group_id_8f130dec_fk_reviews_g FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer reviews_defaultrevie_local_site_id_bcfc837d_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer
    ADD CONSTRAINT reviews_defaultrevie_local_site_id_bcfc837d_fk_site_loca FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_repository reviews_defaultrevie_repository_id_7f3f56b6_fk_scmtools_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_repository
    ADD CONSTRAINT reviews_defaultrevie_repository_id_7f3f56b6_fk_scmtools_ FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_defaultreviewer_people reviews_defaultreviewer_people_user_id_0871feb0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_defaultreviewer_people
    ADD CONSTRAINT reviews_defaultreviewer_people_user_id_0871feb0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_fileattachmentcomment reviews_fileattachme_diff_against_file_at_8a13f559_fk_attachmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment
    ADD CONSTRAINT reviews_fileattachme_diff_against_file_at_8a13f559_fk_attachmen FOREIGN KEY (diff_against_file_attachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_fileattachmentcomment reviews_fileattachme_file_attachment_id_8db79ee7_fk_attachmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment
    ADD CONSTRAINT reviews_fileattachme_file_attachment_id_8db79ee7_fk_attachmen FOREIGN KEY (file_attachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_fileattachmentcomment reviews_fileattachme_reply_to_id_17c9efca_fk_reviews_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_fileattachmentcomment
    ADD CONSTRAINT reviews_fileattachme_reply_to_id_17c9efca_fk_reviews_f FOREIGN KEY (reply_to_id) REFERENCES public.reviews_fileattachmentcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_generalcomment reviews_generalcomme_reply_to_id_d0a69bbf_fk_reviews_g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_generalcomment
    ADD CONSTRAINT reviews_generalcomme_reply_to_id_d0a69bbf_fk_reviews_g FOREIGN KEY (reply_to_id) REFERENCES public.reviews_generalcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_group reviews_group_local_site_id_b7e35237_fk_site_localsite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group
    ADD CONSTRAINT reviews_group_local_site_id_b7e35237_fk_site_localsite_id FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_group_users reviews_group_users_group_id_3bb40386_fk_reviews_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users
    ADD CONSTRAINT reviews_group_users_group_id_3bb40386_fk_reviews_group_id FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_group_users reviews_group_users_user_id_5403120e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_group_users
    ADD CONSTRAINT reviews_group_users_user_id_5403120e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_base_reply_to_id_a208ad8a_fk_reviews_review_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_base_reply_to_id_a208ad8a_fk_reviews_review_id FOREIGN KEY (base_reply_to_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_body_bottom_reply_to_a0c60294_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_body_bottom_reply_to_a0c60294_fk_reviews_r FOREIGN KEY (body_bottom_reply_to_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_body_top_reply_to_id_4f3807c0_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_body_top_reply_to_id_4f3807c0_fk_reviews_r FOREIGN KEY (body_top_reply_to_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_comments reviews_review_comme_comment_id_a1f2afdb_fk_reviews_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments
    ADD CONSTRAINT reviews_review_comme_comment_id_a1f2afdb_fk_reviews_c FOREIGN KEY (comment_id) REFERENCES public.reviews_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_comments reviews_review_comments_review_id_0a600993_fk_reviews_review_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_comments
    ADD CONSTRAINT reviews_review_comments_review_id_0a600993_fk_reviews_review_id FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_file_attachment_comments reviews_review_file__fileattachmentcommen_1dae596b_fk_reviews_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments
    ADD CONSTRAINT reviews_review_file__fileattachmentcommen_1dae596b_fk_reviews_f FOREIGN KEY (fileattachmentcomment_id) REFERENCES public.reviews_fileattachmentcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_file_attachment_comments reviews_review_file__review_id_f33dcceb_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_file_attachment_comments
    ADD CONSTRAINT reviews_review_file__review_id_f33dcceb_fk_reviews_r FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_general_comments reviews_review_gener_generalcomment_id_08380dc1_fk_reviews_g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments
    ADD CONSTRAINT reviews_review_gener_generalcomment_id_08380dc1_fk_reviews_g FOREIGN KEY (generalcomment_id) REFERENCES public.reviews_generalcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_general_comments reviews_review_gener_review_id_b2db3c78_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_general_comments
    ADD CONSTRAINT reviews_review_gener_review_id_b2db3c78_fk_reviews_r FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_review_request_id_be762bb2_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_review_request_id_be762bb2_fk_reviews_r FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_reviewed_diffset_id_4b8bdf06_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_reviewed_diffset_id_4b8bdf06_fk_diffviewe FOREIGN KEY (reviewed_diffset_id) REFERENCES public.diffviewer_diffset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_screenshot_comments reviews_review_scree_review_id_1210ef03_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments
    ADD CONSTRAINT reviews_review_scree_review_id_1210ef03_fk_reviews_r FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review_screenshot_comments reviews_review_scree_screenshotcomment_id_c90580b3_fk_reviews_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review_screenshot_comments
    ADD CONSTRAINT reviews_review_scree_screenshotcomment_id_c90580b3_fk_reviews_s FOREIGN KEY (screenshotcomment_id) REFERENCES public.reviews_screenshotcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_user_id_875caff2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_user_id_875caff2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft reviews_reviewreques_changedesc_id_70a4d612_fk_changedes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewreques_changedesc_id_70a4d612_fk_changedes FOREIGN KEY (changedesc_id) REFERENCES public.changedescs_changedescription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_changedescs reviews_reviewreques_changedescription_id_c25c1fe7_fk_changedes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs
    ADD CONSTRAINT reviews_reviewreques_changedescription_id_c25c1fe7_fk_changedes FOREIGN KEY (changedescription_id) REFERENCES public.changedescs_changedescription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest reviews_reviewreques_diffset_history_id_803728bf_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewreques_diffset_history_id_803728bf_fk_diffviewe FOREIGN KEY (diffset_history_id) REFERENCES public.diffviewer_diffsethistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft reviews_reviewreques_diffset_id_ba3c2e37_fk_diffviewe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewreques_diffset_id_ba3c2e37_fk_diffviewe FOREIGN KEY (diffset_id) REFERENCES public.diffviewer_diffset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_file_attachments reviews_reviewreques_fileattachment_id_70274302_fk_attachmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments
    ADD CONSTRAINT reviews_reviewreques_fileattachment_id_70274302_fk_attachmen FOREIGN KEY (fileattachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_inactive_file_attachments reviews_reviewreques_fileattachment_id_c63ab996_fk_attachmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewreques_fileattachment_id_c63ab996_fk_attachmen FOREIGN KEY (fileattachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_file_attachments reviews_reviewreques_fileattachment_id_e78e0b5e_fk_attachmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments
    ADD CONSTRAINT reviews_reviewreques_fileattachment_id_e78e0b5e_fk_attachmen FOREIGN KEY (fileattachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments reviews_reviewreques_fileattachment_id_fa327aa0_fk_attachmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewreques_fileattachment_id_fa327aa0_fk_attachmen FOREIGN KEY (fileattachment_id) REFERENCES public.attachments_fileattachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_file_attachment_histories reviews_reviewreques_fileattachmenthistor_78c33186_fk_attachmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories
    ADD CONSTRAINT reviews_reviewreques_fileattachmenthistor_78c33186_fk_attachmen FOREIGN KEY (fileattachmenthistory_id) REFERENCES public.attachments_fileattachmenthistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_depends_on reviews_reviewreques_from_reviewrequest_i_2d1eab85_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on
    ADD CONSTRAINT reviews_reviewreques_from_reviewrequest_i_2d1eab85_fk_reviews_r FOREIGN KEY (from_reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_target_groups reviews_reviewreques_group_id_c197c2b6_fk_reviews_g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups
    ADD CONSTRAINT reviews_reviewreques_group_id_c197c2b6_fk_reviews_g FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_target_groups reviews_reviewreques_group_id_f394ff20_fk_reviews_g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups
    ADD CONSTRAINT reviews_reviewreques_group_id_f394ff20_fk_reviews_g FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest reviews_reviewreques_local_site_id_7eadf98c_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewreques_local_site_id_7eadf98c_fk_site_loca FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest reviews_reviewreques_repository_id_a411142d_fk_scmtools_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewreques_repository_id_a411142d_fk_scmtools_ FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft reviews_reviewreques_review_request_id_d23e0b0b_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewreques_review_request_id_d23e0b0b_fk_reviews_r FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_inactive_screenshots reviews_reviewreques_reviewrequest_id_192a5b09_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_192a5b09_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_file_attachments reviews_reviewreques_reviewrequest_id_3bf5d0d8_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachments
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_3bf5d0d8_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_target_people reviews_reviewreques_reviewrequest_id_5b9a960c_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_5b9a960c_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_inactive_file_attachments reviews_reviewreques_reviewrequest_id_649d41ec_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_649d41ec_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_changedescs reviews_reviewreques_reviewrequest_id_65def65a_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_changedescs
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_65def65a_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_screenshots reviews_reviewreques_reviewrequest_id_67148a80_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_67148a80_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_depends_on reviews_reviewreques_reviewrequest_id_834a2c3f_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_834a2c3f_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_file_attachment_histories reviews_reviewreques_reviewrequest_id_84509ea0_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_file_attachment_histories
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_84509ea0_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_target_groups reviews_reviewreques_reviewrequest_id_9f397bce_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_groups
    ADD CONSTRAINT reviews_reviewreques_reviewrequest_id_9f397bce_fk_reviews_r FOREIGN KEY (reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_inactive_file_attachments reviews_reviewreques_reviewrequestdraft_i_29694abc_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_file_attachments
    ADD CONSTRAINT reviews_reviewreques_reviewrequestdraft_i_29694abc_fk_reviews_r FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_depends_on reviews_reviewreques_reviewrequestdraft_i_550d105a_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_depends_on
    ADD CONSTRAINT reviews_reviewreques_reviewrequestdraft_i_550d105a_fk_reviews_r FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_file_attachments reviews_reviewreques_reviewrequestdraft_i_6ca73ce6_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_file_attachments
    ADD CONSTRAINT reviews_reviewreques_reviewrequestdraft_i_6ca73ce6_fk_reviews_r FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots reviews_reviewreques_reviewrequestdraft_i_a8339e18_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots
    ADD CONSTRAINT reviews_reviewreques_reviewrequestdraft_i_a8339e18_fk_reviews_r FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_screenshots reviews_reviewreques_reviewrequestdraft_i_bd7c450d_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots
    ADD CONSTRAINT reviews_reviewreques_reviewrequestdraft_i_bd7c450d_fk_reviews_r FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_target_people reviews_reviewreques_reviewrequestdraft_i_cf9235c2_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people
    ADD CONSTRAINT reviews_reviewreques_reviewrequestdraft_i_cf9235c2_fk_reviews_r FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_target_groups reviews_reviewreques_reviewrequestdraft_i_efd7dd03_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_groups
    ADD CONSTRAINT reviews_reviewreques_reviewrequestdraft_i_efd7dd03_fk_reviews_r FOREIGN KEY (reviewrequestdraft_id) REFERENCES public.reviews_reviewrequestdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_inactive_screenshots reviews_reviewreques_screenshot_id_26fa56c2_fk_reviews_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_inactive_screenshots
    ADD CONSTRAINT reviews_reviewreques_screenshot_id_26fa56c2_fk_reviews_s FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_screenshots reviews_reviewreques_screenshot_id_68b0d9e3_fk_reviews_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_screenshots
    ADD CONSTRAINT reviews_reviewreques_screenshot_id_68b0d9e3_fk_reviews_s FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_screenshots reviews_reviewreques_screenshot_id_a3499d76_fk_reviews_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_screenshots
    ADD CONSTRAINT reviews_reviewreques_screenshot_id_a3499d76_fk_reviews_s FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_inactive_screenshots reviews_reviewreques_screenshot_id_ed06dfad_fk_reviews_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_inactive_screenshots
    ADD CONSTRAINT reviews_reviewreques_screenshot_id_ed06dfad_fk_reviews_s FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_depends_on reviews_reviewreques_to_reviewrequest_id_ab47bf47_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_depends_on
    ADD CONSTRAINT reviews_reviewreques_to_reviewrequest_id_ab47bf47_fk_reviews_r FOREIGN KEY (to_reviewrequest_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest_target_people reviews_reviewreques_user_id_1120a3d1_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest_target_people
    ADD CONSTRAINT reviews_reviewreques_user_id_1120a3d1_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft_target_people reviews_reviewreques_user_id_83de070a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft_target_people
    ADD CONSTRAINT reviews_reviewreques_user_id_83de070a_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequest reviews_reviewrequest_submitter_id_0a5fadde_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequest
    ADD CONSTRAINT reviews_reviewrequest_submitter_id_0a5fadde_fk_auth_user_id FOREIGN KEY (submitter_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_reviewrequestdraft reviews_reviewrequestdraft_owner_id_86066878_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_reviewrequestdraft
    ADD CONSTRAINT reviews_reviewrequestdraft_owner_id_86066878_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_screenshotcomment reviews_screenshotco_reply_to_id_20d83c7c_fk_reviews_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshotcomment
    ADD CONSTRAINT reviews_screenshotco_reply_to_id_20d83c7c_fk_reviews_s FOREIGN KEY (reply_to_id) REFERENCES public.reviews_screenshotcomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_screenshotcomment reviews_screenshotco_screenshot_id_0a8f6ad7_fk_reviews_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_screenshotcomment
    ADD CONSTRAINT reviews_screenshotco_screenshot_id_0a8f6ad7_fk_reviews_s FOREIGN KEY (screenshot_id) REFERENCES public.reviews_screenshot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_statusupdate reviews_statusupdate_change_description_i_260b3553_fk_changedes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_change_description_i_260b3553_fk_changedes FOREIGN KEY (change_description_id) REFERENCES public.changedescs_changedescription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_statusupdate reviews_statusupdate_review_id_cd66ca68_fk_reviews_review_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_review_id_cd66ca68_fk_reviews_review_id FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_statusupdate reviews_statusupdate_review_request_id_09b3d2bf_fk_reviews_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_review_request_id_09b3d2bf_fk_reviews_r FOREIGN KEY (review_request_id) REFERENCES public.reviews_reviewrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_statusupdate reviews_statusupdate_user_id_1f850855_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_statusupdate
    ADD CONSTRAINT reviews_statusupdate_user_id_1f850855_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository_review_groups scmtools_repository__group_id_23e39d23_fk_reviews_g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups
    ADD CONSTRAINT scmtools_repository__group_id_23e39d23_fk_reviews_g FOREIGN KEY (group_id) REFERENCES public.reviews_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository_review_groups scmtools_repository__repository_id_23a2ea36_fk_scmtools_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_review_groups
    ADD CONSTRAINT scmtools_repository__repository_id_23a2ea36_fk_scmtools_ FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository_users scmtools_repository__repository_id_d8c11b09_fk_scmtools_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users
    ADD CONSTRAINT scmtools_repository__repository_id_d8c11b09_fk_scmtools_ FOREIGN KEY (repository_id) REFERENCES public.scmtools_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository scmtools_repository_hosting_account_id_fe34c221_fk_hostingsv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_hosting_account_id_fe34c221_fk_hostingsv FOREIGN KEY (hosting_account_id) REFERENCES public.hostingsvcs_hostingserviceaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository scmtools_repository_local_site_id_989f4f3a_fk_site_localsite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_local_site_id_989f4f3a_fk_site_localsite_id FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository scmtools_repository_tool_id_d3b242d1_fk_scmtools_tool_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository
    ADD CONSTRAINT scmtools_repository_tool_id_d3b242d1_fk_scmtools_tool_id FOREIGN KEY (tool_id) REFERENCES public.scmtools_tool(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scmtools_repository_users scmtools_repository_users_user_id_fd0f89b9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scmtools_repository_users
    ADD CONSTRAINT scmtools_repository_users_user_id_fd0f89b9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_localsite_admins site_localsite_admin_localsite_id_f1ecf08a_fk_site_loca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins
    ADD CONSTRAINT site_localsite_admin_localsite_id_f1ecf08a_fk_site_loca FOREIGN KEY (localsite_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_localsite_admins site_localsite_admins_user_id_a78f941a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_admins
    ADD CONSTRAINT site_localsite_admins_user_id_a78f941a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_localsite_users site_localsite_users_localsite_id_9f338deb_fk_site_localsite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users
    ADD CONSTRAINT site_localsite_users_localsite_id_9f338deb_fk_site_localsite_id FOREIGN KEY (localsite_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_localsite_users site_localsite_users_user_id_d0c1231a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_localsite_users
    ADD CONSTRAINT site_localsite_users_user_id_d0c1231a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: siteconfig_siteconfiguration siteconfig_siteconfiguration_site_id_a352de24_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siteconfig_siteconfiguration
    ADD CONSTRAINT siteconfig_siteconfiguration_site_id_a352de24_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapi_webapitoken webapi_webapitoken_local_site_id_72c83924_fk_site_localsite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken
    ADD CONSTRAINT webapi_webapitoken_local_site_id_72c83924_fk_site_localsite_id FOREIGN KEY (local_site_id) REFERENCES public.site_localsite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapi_webapitoken webapi_webapitoken_user_id_3651ab64_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webapi_webapitoken
    ADD CONSTRAINT webapi_webapitoken_user_id_3651ab64_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

