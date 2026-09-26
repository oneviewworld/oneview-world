// Business details and plans shown on the BookOnRent pages (/bookonrent).
// Plans must match the `plans` table in the BookOnRent Supabase project.

export const BOR = {
  business: 'OneView',
  country: 'India',
  email: 'hello@oneview.world',
  // TODO: add the business address exactly as registered with Razorpay (required for KYC).
  address: '',
  effectiveDate: '26 September 2026',
};

export type Plan = {
  id: 'free' | 'starter' | 'growth' | 'pro' | 'lifetime';
  name: string;
  price: string;
  per: string;
  books: string;
  blurb: string;
  popular?: boolean;
  lifetime?: boolean;
};

export const PLANS: Plan[] = [
  { id: 'free', name: 'Free', price: '₹0', per: 'forever', books: '50 books', blurb: 'Get started with a small library.' },
  { id: 'starter', name: 'Starter', price: '₹99', per: '/ month', books: '300 books', blurb: 'For a growing neighbourhood library.' },
  { id: 'growth', name: 'Growth', price: '₹199', per: '/ month', books: '1,000 books', blurb: 'For busy libraries and book stores.', popular: true },
  { id: 'pro', name: 'Pro', price: '₹349', per: '/ month', books: 'Unlimited books', blurb: 'For large libraries with no limits.' },
  { id: 'lifetime', name: 'Lifetime', price: '₹4,999', per: 'one-time', books: 'Unlimited books', blurb: 'Pay once, use forever. No renewals.', lifetime: true },
];

export const FEATURES = ['Unlimited customers', 'Unlimited rentals', 'WhatsApp due reminders', 'Reports & PDF export', 'Works on any phone, data safe online'];
