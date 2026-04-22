/** Format price number → "50.000 đ" */
export const formatPrice = (val) =>
  new Intl.NumberFormat('vi-VN').format(val) + ' đ';

/** Format distance */
export const formatDistance = (km) =>
  km < 1 ? `${Math.round(km * 1000)} m` : `${km} km`;

/** Truncate text */
export const truncate = (str, max = 80) =>
  str?.length > max ? str.slice(0, max) + '...' : str;

/** Format date string */
export const formatDate = (dateStr) => {
  if (!dateStr) return '';
  const d = new Date(dateStr);
  return d.toLocaleDateString('vi-VN');
};

/** Validate email */
export const isValidEmail = (email) =>
  /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

/** Debounce */
export const debounce = (fn, delay = 400) => {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), delay);
  };
};
