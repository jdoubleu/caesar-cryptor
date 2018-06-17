// Letter frequency

/**
 * Taken from Wikipedia https://en.wikipedia.org/wiki/Letter_frequency#Relative_frequencies_of_letters_in_other_languages
 * German letter frequency from footnote 20 (https://en.wikipedia.org/wiki/Letter_frequency#cite_note-20),
 * Beutelspacher, Albrecht (2005).
 * Kryptologie (7 ed.). Wiesbaden: Vieweg. p. 10. ISBN 3-8348-0014-7.
 *
 * Slighty modified: Removed non-ascii chars and change Umlauts.
 *
 * Code with <table> selected:
 * let german = {};
 * Array.prototype.map.call($0.childNodes[2].children, function(tr) {
 *    return {char: tr.children[0].innerText.toUpperCase(), freq: tr.children[3].innerText};
 *  }).forEach(function(f) {
 *    german[f.char] = parseInt(f.freq)
 * });
 */
const german = {
  "E": 16,
  "N": 9,
  "S": 7,
  "R": 7,
  "I": 0,
  "A": 6,
  "T": 6,
  "D": 5,
  "H": 4,
  "U": 4,
  "L": 3,
  "G": 3,
  "C": 2,
  "O": 2,
  "M": 2,
  "W": 1,
  "B": 1,
  "F": 1,
  "K": 1,
  "Z": 1,
  "UE": 0,
  "V": 0,
  "P": 0,
  "AE": 0,
  "OE": 0,
  "SS": 0,
  "J": 0,
  "Y": 0,
  "X": 0,
  "Q": 0,
};

export { german }
