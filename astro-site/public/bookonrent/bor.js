// Shared browser helpers for the BookOnRent pages.
// The publishable key is safe to expose: every table is protected by Row Level Security.
import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm';

export const SUPABASE_URL = 'https://nuaovlafpbwseolsglnn.supabase.co';
export const SUPABASE_KEY = 'sb_publishable_-llvI5Na_P9PdrjX73D01A_HG0iCt4a';

export const sb = createClient(SUPABASE_URL, SUPABASE_KEY, {
  auth: { persistSession: true, autoRefreshToken: true, detectSessionInUrl: false },
});

/** Returns the session, or sends the visitor to sign in and returns null. */
export async function requireSession() {
  const { data } = await sb.auth.getSession();
  if (data.session) return data.session;
  const next = encodeURIComponent(location.pathname + location.search);
  location.replace(`/bookonrent/signin?next=${next}`);
  return null;
}

/** Only allow redirects back into /bookonrent. */
export function safeNext(value) {
  return value && /^\/bookonrent(\/[\w\-/]*)?(\?[\w=&%\-]*)?$/.test(value) ? value : '/bookonrent/account';
}

/** Calls a Supabase Edge Function as the signed-in user. Throws with a friendly message. */
export async function callFunction(name, body = {}) {
  const { data } = await sb.auth.getSession();
  const res = await fetch(`${SUPABASE_URL}/functions/v1/${name}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      apikey: SUPABASE_KEY,
      Authorization: `Bearer ${data.session?.access_token ?? ''}`,
    },
    body: JSON.stringify(body),
  });
  const json = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(json.error || 'Something went wrong. Please try again.');
  return json;
}

export async function getEntitlement() {
  const { data, error } = await sb.rpc('my_entitlement');
  if (error) throw error;
  return data;
}

export function rupees(paise) {
  return '₹' + (paise / 100).toLocaleString('en-IN', { maximumFractionDigits: 0 });
}

export function formatDate(iso) {
  return iso ? new Date(iso).toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: 'numeric' }) : '—';
}

export function show(el, visible = true) {
  el.classList.toggle('hidden', !visible);
}
