import sys
import json
import glob
from bs4 import BeautifulSoup

html_files = glob.glob('*.html')
res = []
for hfile in html_files:
	with open(hfile, 'r', encoding='utf-8') as f:
		c = f.read()

	listclass = '.wpbdp-listing'
	soup = BeautifulSoup(c, 'html.parser')
	drs = soup.css.select(listclass + ' .listing-details')
	for dr in drs:
		fields = dr.find_all('div', class_='wpbdp-field')
		result = {}
		for f in fields:
			label = f.find('span', class_='field-label')
			value = f.find('span', class_='value')


			if '\n' in value.text:
				values = value.text.split('\n')
				value = [v.replace('•', '').strip() for v in values]
				value = [v for v in value if v != '']

			else:
				value = value.string
				value = value.replace('•', '').strip()


			if label is None:
				result['name'] = value
			else:
				label = label.string
				label = label.replace(':', '')
				if not isinstance(value, list) and (label.startswith('Programs') or label.startswith('Mode') or label.startswith('Population')):
					if value.lower() == 'none specified':
						value = None
					elif ',' in value:
						values = value.split(',')
						value = [v.replace('•', '').strip() for v in values]
						value = [v for v in value if v != '']
					elif ';' in value:
						values = value.split(';')
						value = [v.replace('•', '').strip() for v in values]
						value = [v for v in value if v != '']
				result[label] = value

		res.append(result)
print(json.dumps(res, indent=4))
