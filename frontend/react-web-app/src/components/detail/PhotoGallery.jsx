import { useState } from 'react';

const PhotoGallery = ({ images = [], restaurantName }) => {
  const [active, setActive] = useState(null);

  if (!images.length) return null;

  const main = images[0];
  const thumbs = images.slice(1, 7);

  const len = images.length;
  
  // Điều chỉnh layout tuỳ theo số lượng ảnh
  let gridContainerClass = "grid gap-2 h-[380px] rounded-2xl overflow-hidden";
  let mainImageClass = "relative group cursor-pointer";
  
  if (len === 1) {
    gridContainerClass += " grid-cols-1 grid-rows-1";
    mainImageClass += " col-span-1 row-span-1";
  } else if (len === 2) {
    gridContainerClass += " grid-cols-2 grid-rows-1";
    mainImageClass += " col-span-1 row-span-1";
  } else if (len === 3) {
    gridContainerClass += " grid-cols-2 grid-rows-2";
    mainImageClass += " col-span-1 row-span-2";
  } else if (len === 4) {
    gridContainerClass += " grid-cols-3 grid-rows-2";
    mainImageClass += " col-span-2 row-span-2";
  } else {
    gridContainerClass += " grid-cols-5 grid-rows-2";
    mainImageClass += " col-span-2 row-span-2";
  }

  return (
    <div className={gridContainerClass} id="photo-gallery">
      {/* Main large image */}
      <div className={mainImageClass} onClick={() => setActive(0)}>
        <img
          src={main}
          alt={restaurantName}
          className="w-full h-full object-cover group-hover:brightness-90 transition-all duration-300"
        />
      </div>

      {/* Thumbnails grid */}
      {thumbs.map((img, i) => (
        <div
          key={i}
          className="relative overflow-hidden cursor-pointer group"
          onClick={() => setActive(i + 1)}
        >
          <img
            src={img}
            alt={`${restaurantName} ${i + 2}`}
            className="w-full h-full object-cover group-hover:brightness-90 group-hover:scale-105 transition-all duration-300"
          />
          {/* "See all" overlay on last thumb */}
          {i === thumbs.length - 1 && images.length > 7 && (
            <div className="absolute inset-0 bg-black/50 flex items-center justify-center">
              <span className="text-white font-[Baloo_2,sans-serif] font-bold text-lg">+{images.length - 7} ảnh</span>
            </div>
          )}
        </div>
      ))}

      {/* Lightbox */}
      {active !== null && (
        <div
          className="fixed inset-0 z-[500] bg-black/90 flex items-center justify-center p-4"
          onClick={() => setActive(null)}
        >
          <img
            src={images[active]}
            alt={restaurantName}
            className="max-w-full max-h-[90vh] object-contain rounded-xl shadow-2xl"
            onClick={(e) => e.stopPropagation()}
          />
          <button
            className="absolute top-5 right-5 text-white text-2xl hover:text-[#F4836A] transition-colors"
            onClick={() => setActive(null)}
          >✕</button>
          {active > 0 && (
            <button
              className="absolute left-5 top-1/2 -translate-y-1/2 text-white text-3xl hover:text-[#F4836A]"
              onClick={(e) => { e.stopPropagation(); setActive(active - 1); }}
            >‹</button>
          )}
          {active < images.length - 1 && (
            <button
              className="absolute right-16 top-1/2 -translate-y-1/2 text-white text-3xl hover:text-[#F4836A]"
              onClick={(e) => { e.stopPropagation(); setActive(active + 1); }}
            >›</button>
          )}
        </div>
      )}
    </div>
  );
};

export default PhotoGallery;
