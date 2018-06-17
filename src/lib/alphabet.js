// Letter frequency

/**
 * Taken from Wikipedia https://en.wikipedia.org/wiki/Letter_frequency#Relative_frequencies_of_letters_in_other_languages
 * German letter frequency from footnote 20 (https://en.wikipedia.org/wiki/Letter_frequency#cite_note-20),
 * Beutelspacher, Albrecht (2005). Kryptologie (7 ed.). Wiesbaden: Vieweg. p. 10. ISBN 3-8348-0014-7.
 *
 * Slighty modified: Removed non-ascii chars and change Umlauts.
 *
 * Code with <table> selected:
 * let german = {};
 * Array.prototype.map.call($0.childNodes[2].children,
 function(tr) { return {char: tr.children[0].innerText,
 freq: tr.children[3].innerText}; }).forEach(function(f) {german[f.char] = parseInt(f.freq)});
 */
const german = {
  "e": 16,
  "n": 9,
  "s": 7,
  "r": 7,
  "i": 6,
  "a": 6,
  "t": 6,
  "d": 5,
  "h": 4,
  "u": 4,
  "l": 3,
  "g": 3,
  "c": 2,
  "o": 2,
  "m": 2,
  "w": 1,
  "b": 1,
  "f": 1,
  "k": 1,
  "z": 1,
  "ue": 0,
  "v": 0,
  "p": 0,
  "ae": 0,
  "oe": 0,
  "ß": 0,
  "j": 0,
  "y": 0,
  "x": 0,
  "q": 0
};

export { german }
